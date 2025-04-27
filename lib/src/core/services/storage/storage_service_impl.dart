import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'storage_service.dart';

class StorageServiceImpl extends ChangeNotifier implements StorageService {
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();

  factory StorageServiceImpl() {
    return _instance;
  }

  StorageServiceImpl._internal();

  // Auth-related keys
  static const String _tokenKey = 'TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';
  static const String _roleKey = 'ROLE';
  static const String _languageCode = 'LANGUAGE_CODE';
  static const String _idKey = 'ID';
  static const String _emailKey = 'EMAIL';
  static const String _nameKey = 'NAME';
  static const String _lastNameKey = 'LAST_NAME';

  // Device-related keys
  static const String _clientIdKey = 'CLIENT_ID';
  static const String _lastSentFcmTokenKey = 'LAST_SENT_FCM_TOKEN';

  late Box authBox;
  late Box deviceBox;

  String? _cachedLastSentFcmToken;

  // Device-related methods

  Future<void> setLastSentFcmToken(String? token) async {
    try {
      _cachedLastSentFcmToken = token;
      await deviceBox.put(_lastSentFcmTokenKey, token);
      debugPrint('Last sent FCM token saved successfully: $token');
    } catch (e) {
      debugPrint('Error saving last sent FCM token: $e');
      rethrow;
    }
  }

  String? getLastSentFcmToken() {
    try {
      if (_cachedLastSentFcmToken != null) return _cachedLastSentFcmToken;
      _cachedLastSentFcmToken = deviceBox.get(_lastSentFcmTokenKey);
      debugPrint('Retrieved last sent FCM token: $_cachedLastSentFcmToken');
      return _cachedLastSentFcmToken;
    } catch (e) {
      debugPrint('Error getting last sent FCM token: $e');
      return null;
    }
  }

  @override
  Future<void> setUserId(int userId) async {
    log('Setting user ID: $userId', name: 'StorageService');
    try {
      await authBox.put(_idKey, userId);
      debugPrint('User ID saved successfully: $userId');
    } catch (e) {
      debugPrint('Error saving user ID: $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserName(String userName) async {
    try {
      await authBox.put(_nameKey, userName);
      debugPrint('User name saved successfully: $userName');
    } catch (e) {
      debugPrint('Error saving user name: $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserEmail(String userEmail) async {
    try {
      await authBox.put(_emailKey, userEmail);
      debugPrint('User email saved successfully: $userEmail');
    } catch (e) {
      debugPrint('Error saving user email: $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserLastName(String lastName) async {
    try {
      await authBox.put(_lastNameKey, lastName);
      debugPrint('User last name saved successfully: $lastName');
    } catch (e) {
      debugPrint('Error saving user last name: $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserFirstName(String firstName) async {
    try {
      await authBox.put(_nameKey, firstName);
      debugPrint('User first name saved successfully: $firstName');
    } catch (e) {
      debugPrint('Error saving user first name: $e');
      rethrow;
    }
  }

  @override
  int? getUserId() {
    try {
      final userId = authBox.get(_idKey);
      log('Retrieved user ID: $userId', name: 'StorageService');
      return userId;
    } catch (e) {
      log('Error getting user ID: $e', name: 'StorageService');
      return null;
    }
  }

  @override
  String? getUserFirstName() {
    try {
      final userName = authBox.get(_nameKey);
      debugPrint('Retrieved user name: $userName');
      return userName;
    } catch (e) {
      debugPrint('Error getting user name: $e');
      return null;
    }
  }

  @override
  String? getUserEmail() {
    try {
      final userEmail = authBox.get(_emailKey);
      debugPrint('Retrieved user email: $userEmail');
      return userEmail;
    } catch (e) {
      debugPrint('Error getting user email: $e');
      return null;
    }
  }

  @override
  String? getUserLastName() {
    try {
      final lastName = authBox.get(_lastNameKey);
      debugPrint('Retrieved user last name: $lastName');
      return lastName;
    } catch (e) {
      debugPrint('Error getting user last name: $e');
      return null;
    }
  }

  @override
  Future<void> setClientId(String clientId) async {
    try {
      await deviceBox.put(_clientIdKey, clientId);
      debugPrint('Client ID saved successfully: $clientId');
    } catch (e) {
      debugPrint('Error saving client ID: $e');
      rethrow;
    }
  }

  @override
  String getClientId() {
    try {
      final clientId = deviceBox.get(_clientIdKey);
      debugPrint('Retrieved client ID: $clientId');
      return clientId ?? '';
    } catch (e) {
      debugPrint('Error getting client ID: $e');
      return '';
    }
  }

  // Auth-related methods
  @override
  Future<void> setToken(String? token) async {
    log('Setting access token: ${token?.substring(0, 20)}...', name: 'StorageService');
    await authBox.put(_tokenKey, token);
    notifyListeners();
  }

  @override
  Future<void> setRole(String? role) async {
    log('$role', name: 'CURRENT_ROLE');
    await authBox.put(_roleKey, role);
    notifyListeners();
  }

  @override
  Future<void> setRefreshToken(String? refreshToken) async {
    log('Setting refresh token: ${refreshToken?.substring(0, 20)}...', name: 'StorageService');
    await authBox.put(_refreshTokenKey, refreshToken);
    notifyListeners();
  }

  @override
  Future<void> setLanguageCode(String code) async {
    await authBox.put(_languageCode, code);
  }

  @override
  String? getToken() {
    final token = authBox.get(_tokenKey);
    log('Retrieved access token: ${token?.substring(0, 20)}...', name: 'StorageService');
    return token;
  }

  @override
  String? getRole() {
    return authBox.get(_roleKey);
  }

  @override
  String? getRefreshToken() {
    final refreshToken = authBox.get(_refreshTokenKey);
    log('Retrieved refresh token: ${refreshToken?.substring(0, 20)}...', name: 'StorageService');
    return refreshToken;
  }

  @override
  Future<void> deleteToken() async {
    log('Deleting access token', name: 'StorageService');
    await authBox.delete(_tokenKey);
    notifyListeners();
  }

  @override
  Future<void> deleteRefreshToken() async {
    log('Deleting refresh token', name: 'StorageService');
    await authBox.delete(_refreshTokenKey);
    notifyListeners();
  }

  @override
  String? getLanguageCode() {
    return authBox.get(_languageCode);
  }

  // Clear methods
  Future<void> clearAuth() async {
    if (authBox.isOpen) {
      await authBox.clear();
      notifyListeners();
    }
  }

  // Clear only device data
  Future<void> clearDeviceData() async {
    if (deviceBox.isOpen) {
      _cachedLastSentFcmToken = null;
      await deviceBox.clear();
    }
  }

  // Interface compatibility method - clears all data
  @override
  Future<void> clear() async {
    await clearAll();
  }

  // Clear all data
  Future<void> clearAll() async {
    try {
      // Clear auth data
      if (authBox.isOpen) {
        await authBox.clear();
      }

      // Clear device data
      if (deviceBox.isOpen) {
        _cachedLastSentFcmToken = null;
        await deviceBox.clear();
      }

      // Reset cached values
      _initializeCachedValues();

      // Notify listeners
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing storage: $e');
      rethrow;
    }
  }

  // Initialization methods
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    authBox = await Hive.openBox('auth');
    deviceBox = await Hive.openBox('device');
    _initializeCachedValues();
  }

  @override
  Future<void> openBox() async {
    authBox = await Hive.openBox('auth');
    deviceBox = await Hive.openBox('device');
    _initializeCachedValues();
  }

  void _initializeCachedValues() {
    _cachedLastSentFcmToken = deviceBox.get(_lastSentFcmTokenKey);
  }

  @override
  bool checkLoggedIn() {
    return getToken() != null;
  }

  @override
  bool get isLoggedIn => checkLoggedIn();

  @override
  Future<void> deleteUserEmail() async {
    await authBox.delete(_emailKey);
    notifyListeners();
  }

  @override
  Future<void> deleteUserFirstName() async {
    await authBox.delete(_nameKey);
    notifyListeners();
  }

  @override
  Future<void> deleteUserId() async {
    await authBox.delete(_idKey);
    notifyListeners();
  }

  @override
  Future<void> deleteUserLastName() async {
    await authBox.delete(_lastNameKey);
    notifyListeners();
  }
}
