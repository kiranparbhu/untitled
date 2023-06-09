import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:/ui/auth/model/login_response_dto.dart';

class PreferencesManager {
  static const _keyUserToken = 'keyUserToken';
  static const _keyEodCheckoutTime = 'keyEodCheckoutTime';
  static const _keyUserProfile = 'keyUserProfile';
  static const keyLanguageCode = 'language_code';
  static const keyIsGuestUser = 'guest_user';
  static const keyFullName = 'name';
  static const keyEmail = 'email';
  static const keyIsTimeIN = 'isTimeIn';
  static const keyUserRole = 'userRole';
  static const isPermissionPopShown = 'is_permission_pop_shown';
  static const isAllTimePermissionPopShown = 'is_all_time_permission_pop_shown';

  Future<bool> isLoggedIn() async {
    final preferences = await _getPreferences();
    return preferences.containsKey(_keyUserToken) && preferences.containsKey(_keyUserProfile);
  }

  Future<bool> isGuestUser() async {
    final preferences = await _getPreferences();
    return preferences.getBool(keyIsGuestUser) ?? false;
  }

  void setGuestUser(bool isGuestUser) async {
    (await _getPreferences()).setBool(keyIsGuestUser, isGuestUser);
  }

  Future<SharedPreferences> _getPreferences() async => await SharedPreferences.getInstance();

  Future<String?> getUserToken() async {
    return (await _getPreferences()).getString(_keyUserToken);
  }

  void setUserToken(String? token) async {
    if (token == null || token.isEmpty) {
      (await _getPreferences()).remove(_keyUserToken);
    } else {
      (await _getPreferences()).setString(_keyUserToken, token);
    }
  }

  void setEodCheckoutTime(int? timestamp) async {
    if (timestamp == null) {
      (await _getPreferences()).remove(_keyEodCheckoutTime);
    } else {
      (await _getPreferences()).setInt(_keyEodCheckoutTime, timestamp);
    }
  }

  Future<int?> getEodCheckoutTime() async {
    return (await _getPreferences()).getInt(_keyEodCheckoutTime);
  }

  /// Get [String] from the [SharedPreferences]
  Stream<String?> getString(String key) {
    return _getSharedPreference().map((preference) => preference.getString(key));
  }

  /// Get [String] from the [SharedPreferences]
  Stream<String> getLocaleString(String? key) {
    return _getSharedPreference().map((preference) => preference.getString(key!) ?? 'en');
  }

  /// Set [String] to the [SharedPreferences]
  Stream<bool> setString(String key, String value) {
    return _getSharedPreference().flatMap((preference) => _convertToRx(preference.setString(key, value)));
  }

  Stream<SharedPreferences> _getSharedPreference() {
    return _convertToRx(_getPreferences());
  }

  Stream<T> _convertToRx<T>(Future<T> future) {
    return future.asStream();
  }

  void clear() async {
    (await _getPreferences()).clear();
  }

  // void setUserProfile(LoginResponseDto? user) async {
  //   if (user == null) {
  //     (await _getPreferences()).remove(_keyUserProfile);
  //   } else {
  //     final userJson = jsonEncode(user.toJson());
  //     (await _getPreferences()).setString(_keyUserProfile, userJson);
  //   }
  // }

  void setUserRole(String? role) async {
    if (role == null) {
      (await _getPreferences()).remove(keyUserRole);
    } else {
      (await _getPreferences()).setString(keyUserRole, role);
    }
  }

  Future<String?> getUserRole() async {
    return (await _getPreferences()).getString(keyUserRole);
  }

  /// Get [bool] from the [SharedPreferences]
  Future<bool?> getFutureBool(String key) async {
    return (await _getPreferences()).getBool(key);
  }

  /// Get [bool] from the [SharedPreferences]
  Stream<bool?> getBool(String key) {
    return _getSharedPreference().map((preference) => preference.getBool(key));
  }

  /// Set [bool] to the [SharedPreferences]
  Stream<bool> setBool(String key, bool value) {
    return _getSharedPreference().flatMap((preference) => _convertToRx(preference.setBool(key, value)));
  }

  // Future<LoginResponseDto?> getUserProfile() async {
  //   final userJson = (await _getPreferences()).getString(_keyUserProfile);
  //   if (userJson == null || userJson.isEmpty) {
  //     return null;
  //   }
  //
  //   try {
  //     final userMap = jsonDecode(userJson);
  //     return LoginResponseDto.fromJson(userMap);
  //   } catch (exception) {
  //     return null;
  //   }
  // }

/* Future<String?> getUserId() async {
    final userJson = (await _getPreferences()).getString(_keyUserProfile);
    if (userJson == null || userJson.isEmpty) {
      return null;
    }

    try {
      final userMap = jsonDecode(userJson);
      var userDto = User.fromJson(userMap);
      return userDto.id.toString();
    } catch (exception) {
      return null;
    }
  }*/
}