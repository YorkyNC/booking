part of 'dio_client.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({
    Dio? dio,
  }) : dio = dio ?? Dio();

  final StorageServiceImpl st = StorageServiceImpl();
  final Dio dio;

  bool _isRefreshing = false;
  Completer<String>? _refreshCompleter;
  final _queue = <QueueItem>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = st.getToken();
    _log('Raw Token Value: $accessToken');

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken.startsWith('Bearer ') ? accessToken : 'Bearer $accessToken';
    } else {
      _log('No token available in storage');
    }

    _log('Final Headers: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log('Response: ${response.statusCode} ${response.statusMessage}');
    return handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    _log('Error Status Code: ${err.response?.statusCode}');
    _log('Error Response: ${err.response?.data}');
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    _log('Received 401 error. Attempting to refresh token...');
    final requestOptions = err.requestOptions;

    try {
      final token = await _refreshTokenAndGetNew(requestOptions);
      if (token == null) {
        await _handleRefreshFailure(handler, err);
        return;
      }

      final response = await _retryRequest(requestOptions, token);
      return handler.resolve(response);
    } catch (e) {
      _log('Error during refresh and retry: $e');
      await _handleRefreshFailure(handler, err);
    }
  }

  Future<String?> _refreshTokenAndGetNew(RequestOptions requestOptions) async {
    log('Starting token refresh process', name: 'DioInterceptor');
    // Add request to queue
    final completer = Completer<Response>();
    _queue.add(QueueItem(requestOptions, completer));

    try {
      if (!_isRefreshing) {
        _isRefreshing = true;
        _refreshCompleter = Completer<String>();
        log('Initiating token refresh', name: 'DioInterceptor');

        final refreshed = await _refreshToken();
        if (refreshed) {
          final newToken = st.getToken();
          log('Token refresh successful. New token: ${newToken?.substring(0, 20)}...', name: 'DioInterceptor');
          _refreshCompleter?.complete(newToken);
          return newToken;
        } else {
          log('Token refresh failed', name: 'DioInterceptor');
          _refreshCompleter?.completeError('Refresh failed');
          return null;
        }
      } else {
        log('Token refresh already in progress, waiting for completion', name: 'DioInterceptor');
        return await _refreshCompleter?.future;
      }
    } catch (e) {
      log('Error during token refresh: $e', name: 'DioInterceptor');
      _refreshCompleter?.completeError(e);
      rethrow;
    } finally {
      if (_isRefreshing) {
        _isRefreshing = false;
        await _processQueue();
      }
    }
  }

  Future<bool> _refreshToken() async {
    final String? refreshToken = st.getRefreshToken();
    log('Current refresh token: ${refreshToken?.substring(0, 20)}...', name: 'DioInterceptor');

    if (refreshToken == null) {
      log('No refresh token available.', name: 'DioInterceptor');
      return false;
    }

    try {
      log('Attempting token refresh request', name: 'DioInterceptor');
      final response = await dio.post(
        EndPoints.baseUrl + EndPoints.refreshToken,
        data: {"refreshToken": refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      log('Token refresh response status: ${response.statusCode}', name: 'DioInterceptor');
      if (response.statusCode == 200 && response.data != null) {
        final data = RefreshTokenResponse.fromJson(response.data);
        if (data.accessToken.isNotEmpty && data.refreshToken.isNotEmpty) {
          log('Storing new tokens and user data', name: 'DioInterceptor');
          await st.setToken(data.accessToken);
          await st.setRefreshToken(data.refreshToken);
          await st.setUserId(data.user.id!);
          await st.setUserName(data.user.firstName!);
          await st.setUserEmail(data.user.email!);
          await st.setUserLastName(data.user.lastName!);

          log('Token refresh successful', name: 'DioInterceptor');
          return true;
        }
      }

      log('Invalid response during token refresh: ${response.statusCode}', name: 'DioInterceptor');
      return false;
    } catch (e) {
      log('Token refresh failed with error: $e', name: 'DioInterceptor');
      return false;
    }
  }

  Future<void> _processQueue() async {
    final token = st.getToken();
    if (token == null) {
      _clearQueue();
      return;
    }

    final requests = List<QueueItem>.from(_queue);
    _queue.clear();

    for (final item in requests) {
      try {
        final response = await _retryRequest(item.options, token);
        item.completer.complete(response);
      } catch (e) {
        item.completer.completeError(e);
      }
    }
  }

  void _clearQueue() {
    for (final item in _queue) {
      item.completer.completeError('Authentication failed');
    }
    _queue.clear();
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions, String token) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $token',
      },
      validateStatus: (status) => status != null && status < 500,
    );

    final retryDio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    return retryDio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> _handleRefreshFailure(ErrorInterceptorHandler handler, DioException originalError) async {
    _log('Token refresh failed, logging out user');
    await _logoutUser();
    _clearQueue();

    handler.reject(
      DioException(
        requestOptions: originalError.requestOptions,
        error: 'Authentication failed. Please log in again.',
        type: DioExceptionType.unknown,
        response: originalError.response,
      ),
    );
  }

  Future<void> _logoutUser() async {
    await st.deleteToken();
    await st.clear();

    // RoleNotifier().notify();
  }

  void _log(String message) {
    if (kDebugMode) {
      log(message, name: 'DioInterceptor');
    }
  }
}

class QueueItem {
  final RequestOptions options;
  final Completer<Response> completer;

  QueueItem(this.options, this.completer);
}
