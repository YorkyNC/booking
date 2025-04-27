abstract class StorageService {
  // Fcm token methods
  Future<void> setClientId(String clientId);
  String? getClientId();
  // Quality methods
  // Auth
  Future<void> setUserId(int userId);
  int? getUserId();
  Future<void> deleteUserId();
  Future<void> setUserName(String userName);
  Future<void> setUserEmail(String userEmail);
  String? getUserEmail();
  Future<void> deleteUserEmail();
  Future<void> setUserLastName(String lastName);
  String? getUserLastName();
  Future<void> deleteUserLastName();
  Future<void> setUserFirstName(String firstName);
  String? getUserFirstName();
  Future<void> deleteUserFirstName();

  // Token and authentication methods
  Future<void> setToken(String? token);
  String? getToken();
  Future<void> deleteToken();
  Future<void> setRefreshToken(String? refreshToken);
  String? getRefreshToken();
  Future<void> deleteRefreshToken();

  // Role management
  Future<void> setRole(String? role);
  String? getRole();

  // Language preferences
  Future<void> setLanguageCode(String code);
  String? getLanguageCode();

  // Box management
  Future<void> init();
  Future<void> openBox();
  Future<void> clear();

  // Authentication status
  bool checkLoggedIn();
  bool get isLoggedIn;
}
