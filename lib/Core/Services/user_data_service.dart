import 'package:hive_flutter/hive_flutter.dart';
import '../../Features/Auth/Data/Model/user_model.dart';
import 'user_model_adapter.dart';

class UserDataService {
  static const String _userBoxName = 'user_data';
  static const String _userKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _tokenKey = 'auth_token';
  
  static Box? _userBox;

  /// Initialize Hive box for user data
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register adapter if not already registered
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    
    // Open user data box
    _userBox = await Hive.openBox(_userBoxName);
  }

  /// Ensure box is initialized
  static Future<void> _ensureInitialized() async {
    if (_userBox == null) {
      await init();
    }
  }

  /// Save user data when logging in
  static Future<bool> saveUserData({
    required UserModel user,
    String? authToken,
  }) async {
    try {
      await _ensureInitialized();
      
      // Save user data
      await _userBox!.put(_userKey, user);
      await _userBox!.put(_isLoggedInKey, true);
      
      // Save auth token if provided
      if (authToken != null && authToken.isNotEmpty) {
        await _userBox!.put(_tokenKey, authToken);
      }
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get current user data
  static Future<UserModel?> getCurrentUser() async {
    try {
      await _ensureInitialized();
      return _userBox!.get(_userKey) as UserModel?;
    } catch (e) {
      return null;
    }
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    try {
      await _ensureInitialized();
      return _userBox!.get(_isLoggedInKey, defaultValue: false) as bool;
    } catch (e) {
      return false;
    }
  }

  /// Get auth token
  static Future<String?> getAuthToken() async {
    try {
      await _ensureInitialized();
      return _userBox!.get(_tokenKey) as String?;
    } catch (e) {
      return null;
    }
  }

  /// Update user data (for profile updates)
  static Future<bool> updateUserData(UserModel user) async {
    try {
      await _ensureInitialized();
      await _userBox!.put(_userKey, user);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Clear all user data when logging out
  static Future<bool> clearUserData() async {
    try {
      await _ensureInitialized();
      
      // Remove all user-related data
      await _userBox!.delete(_userKey);
      await _userBox!.delete(_isLoggedInKey);
      await _userBox!.delete(_tokenKey);
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get user ID (helper method)
  static Future<int?> getUserId() async {
    try {
      final user = await getCurrentUser();
      return user?.id;
    } catch (e) {
      return null;
    }
  }

  /// Get username (helper method)
  static Future<String?> getUsername() async {
    try {
      final user = await getCurrentUser();
      return user?.username;
    } catch (e) {
      return null;
    }
  }

  /// Get user email (helper method)
  static Future<String?> getUserEmail() async {
    try {
      final user = await getCurrentUser();
      return user?.email;
    } catch (e) {
      return null;
    }
  }

  /// Check if user has specific role
  static Future<bool> hasRole(String role) async {
    try {
      final user = await getCurrentUser();
      return user?.role.toLowerCase() == role.toLowerCase();
    } catch (e) {
      return false;
    }
  }

  /// Check if user is banned
  static Future<bool> isUserBanned() async {
    try {
      final user = await getCurrentUser();
      return user?.isBanned == 1;
    } catch (e) {
      return false;
    }
  }

  /// Get all user data as Map (for debugging)
  static Future<Map<String, dynamic>?> getAllUserData() async {
    try {
      final user = await getCurrentUser();
      final isLoggedIn = await UserDataService.isLoggedIn();
      
      if (user == null) return null;
      
      return {
        'user': user.toJson(),
        'isLoggedIn': isLoggedIn,
      };
    } catch (e) {
      return null;
    }
  }

  /// Clear all data (for complete reset)
  static Future<bool> clearAllData() async {
    try {
      await _ensureInitialized();
      await _userBox!.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
