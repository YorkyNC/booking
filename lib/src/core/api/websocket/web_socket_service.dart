// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io' as io;

// import 'package:flutter/foundation.dart';
// import 'package:booking/src/core/api/client/rest/dio/dio_client.dart';
// import 'package:booking/src/core/services/storage/storage_service_impl.dart';
// import 'package:spinify/spinify.dart';

// enum WebSocketConnectionState { disconnected, connecting, connected, closed }

// class WebSocketService {
//   final StorageServiceImpl _storageService = StorageServiceImpl();
//   Spinify? _client;
//   final Map<String, SpinifySubscription> _subscriptions = {};

//   final _connectionStateController = StreamController<WebSocketConnectionState>.broadcast();
//   final _messageController = StreamController<Map<String, dynamic>>.broadcast();

//   Stream<WebSocketConnectionState> get connectionState => _connectionStateController.stream;
//   Stream<Map<String, dynamic>> get messages => _messageController.stream;

//   WebSocketService() {
//     _initializeClient();
//   }

//   void _initializeClient() {
//     final token = _storageService.getToken();
//     if (token == null) return;

//     _client = Spinify(
//       config: SpinifyConfig(
//         client: (name: 'kepler_app', version: '1.0.0'),
//         timeout: const Duration(seconds: 15),
//         serverPingDelay: const Duration(seconds: 8),
//         connectionRetryInterval: (
//           min: const Duration(milliseconds: 250),
//           max: const Duration(seconds: 15),
//         ),
//         getToken: _getRefreshedToken,
//         getPayload: () async => utf8.encode('Hello, World!'),
//         codec: SpinifyProtobufCodec(),
//         transportBuilder: SpinifyTransportAdapter.vm(
//           compression: io.CompressionOptions.compressionDefault,
//           customClient: DioRestClient(),
//           userAgent: 'Dart',
//         ),
//         logger: (level, event, message, context) => print('[WWWW$event] $message'),
//       ),
//     );

//     _setupClientListeners();
//   }

//   Future<String> _getRefreshedToken() async {
//     return _storageService.getToken() ?? '';
//   }

//   void _setupClientListeners() {
//     if (_client!.state.isConnecting) {
//       _connectionStateController.add(WebSocketConnectionState.connecting);
//     }

//     if (_client!.state.isConnected) {
//       _connectionStateController.add(WebSocketConnectionState.connected);
//       _resubscribeToChannels();
//     }

//     if (_client!.state.isDisconnected) {
//       _connectionStateController.add(WebSocketConnectionState.disconnected);
//     }
//   }

//   Future<void> _resubscribeToChannels() async {
//     for (final subscription in _subscriptions.values) {
//       try {
//         subscription.stream.subscribe();
//       } catch (e) {
//         debugPrint('Error resubscribing to channel: $e');
//       }
//     }
//   }

//   Future<void> connect() async {
//     try {
//       if (_client == null) {
//         _initializeClient();
//       }
//       await _client?.connect('ws://centrifugo.greeneye.kz/connection/websocket');
//     } catch (e) {
//       debugPrint('WebSocket connect error: $e');
//       rethrow;
//     }
//   }

//   Future<void> disconnect() async {
//     try {
//       await _client?.close();
//       _subscriptions.clear();
//       _connectionStateController.add(WebSocketConnectionState.closed);
//     } catch (e) {
//       debugPrint('WebSocket disconnect error: $e');
//       rethrow;
//     }
//   }

//   Future<SpinifySubscription> subscribe(String channel) async {
//     if (_client == null) {
//       throw Exception('Client not initialized');
//     }

//     // Return existing subscription if already subscribed
//     if (_subscriptions.containsKey(channel)) {
//       return _subscriptions[channel]!;
//     }

//     final subscription = _client!.newSubscription(channel);

//     // Setup subscription listeners
//     subscription.stream.publication().listen((event) {
//       try {
//         log('XXXXX${event.data}');
//         final jsonStr = utf8.decode(event.data);
//         final data = jsonDecode(jsonStr) as Map<String, dynamic>;
//         _messageController.add(data);
//       } catch (e) {
//         debugPrint('Error decoding publication data: $e');
//       }
//     });

//     subscription.stream.listen((data) {
//       log('YYYYY$data');
//       debugPrint('Successfully subscribed to channel: $channel');
//       debugPrint('channel data: $data');
//     }, onDone: () {
//       debugPrint('Unsubscribed from channel: $channel');
//       _subscriptions.remove(channel);
//     }, onError: (error) {
//       debugPrint('Subscription error for channel $channel: $error');
//     });

//     // Store and subscribe
//     _subscriptions[channel] = subscription;
//     await subscription.subscribe();
//     return subscription;
//   }

//   Future<void> unsubscribe(String channel) async {
//     final subscription = _subscriptions[channel];
//     if (subscription != null) {
//       subscription.stream.unsubscribe();
//       _subscriptions.remove(channel);
//     }
//   }

//   Future<void> publish(String channel, Map<String, dynamic> data) async {
//     final subscription = _subscriptions[channel];
//     if (subscription == null) {
//       throw Exception('Not subscribed to channel: $channel');
//     }

//     try {
//       final bytes = utf8.encode(jsonEncode(data));
//       await subscription.publish(bytes);
//     } catch (e) {
//       debugPrint('Error publishing to channel $channel: $e');
//       rethrow;
//     }
//   }

//   Future<void> dispose() async {
//     try {
//       for (final subscription in _subscriptions.values) {
//         subscription.stream.unsubscribe();
//       }
//       _subscriptions.clear();

//       await _client?.close();
//       await _connectionStateController.close();
//       await _messageController.close();
//     } catch (e) {
//       debugPrint('Error disposing WebSocket service: $e');
//       rethrow;
//     }
//   }

//   bool isConnected() {
//     return _client?.state.isConnected ?? false;
//   }

//   bool isSubscribed(String channel) {
//     return _subscriptions.containsKey(channel);
//   }
// }
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../router/router.dart';

class WebSocketService {
  static const String _wsUrl = 'ws://centrifugo.greeneye.kz/connection/websocket';
  WebSocketChannel? _channel;
  final _messageController = StreamController<Map<String, dynamic>>.broadcast();
  Timer? _pingTimer;
  int _messageId = 0;

  bool get isConnected => _channel != null;
  Stream<Map<String, dynamic>> get messageStream => _messageController.stream;

  Future<void> connect() async {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_wsUrl));

      // Listen for incoming messages
      _channel?.stream.listen(
        (message) {
          try {
            final decodedMessage = jsonDecode(message as String);
            _handleIncomingMessage(decodedMessage);
          } catch (e) {
            debugPrint('Error decoding message: $e');
          }
        },
        onError: (error) {
          debugPrint('WebSocket error: $error');
          _cleanup();
          _reconnect();
        },
        onDone: () {
          debugPrint('WebSocket connection closed');
          _cleanup();
          _reconnect();
        },
      );

      // Send connect command
      _sendConnectCommand();
    } catch (e) {
      debugPrint('Error connecting to WebSocket: $e');
      _cleanup();
      rethrow;
    }
  }

  void _sendConnectCommand() {
    final token = st.getToken(); // Get your JWT token
    if (token == null) {
      throw Exception('No authentication token available');
    }

    final connectMessage = {
      'id': _getNextMessageId(),
      'connect': {
        'token': token,
        'name': 'flutter-client',
        'version': '0.0.1',
      }
    };

    sendMessage(connectMessage);
    _startPingTimer();
  }

  void _handleIncomingMessage(Map<String, dynamic> message) {
    if (message.containsKey('ping')) {
      _handlePing();
      return;
    }

    if (message.containsKey('push')) {
      final pushData = message['push'];
      if (pushData != null && pushData is Map<String, dynamic>) {
        _messageController.add(pushData);
      }
      return;
    }

    // Handle other message types (connect response, subscribe response, etc.)
    _messageController.add(message);
  }

  void _handlePing() {
    sendMessage({'id': _getNextMessageId(), 'pong': {}});
  }

  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(const Duration(seconds: 25), (timer) {
      if (isConnected) {
        sendMessage({'id': _getNextMessageId(), 'ping': {}});
      }
    });
  }

  int _getNextMessageId() {
    return _messageId++;
  }

  void subscribeToChannel(String channel) {
    if (!isConnected) {
      throw Exception('WebSocket is not connected');
    }

    sendMessage('personal:#${getCurrentRole().sub}' as Map<String, dynamic>);
  }

  void unsubscribeFromChannel(String channel) {
    if (!isConnected) {
      throw Exception('WebSocket is not connected');
    }

    final unsubscribeMessage = {
      'id': _getNextMessageId(),
      'unsubscribe': {'channel': channel}
    };

    sendMessage(unsubscribeMessage);
  }

  void sendMessage(Map<String, dynamic> message) {
    if (!isConnected) {
      throw Exception('WebSocket is not connected');
    }

    try {
      final encodedMessage = jsonEncode(message);
      _channel?.sink.add(encodedMessage);
    } catch (e) {
      debugPrint('Error sending message: $e');
      rethrow;
    }
  }

  Future<void> _cleanup() async {
    _pingTimer?.cancel();
    _pingTimer = null;
    await _channel?.sink.close();
    _channel = null;
  }

  Future<void> _reconnect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!isConnected) {
      connect();
    }
  }

  Future<void> disconnect() async {
    await _cleanup();
  }

  void dispose() {
    disconnect();
    _messageController.close();
  }
}
