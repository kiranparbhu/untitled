import 'dart:convert';

import 'package:col/ui/auth/model/loginResponseModel.dart';
import 'package:col/ui/auth/model/login_response_model.dart';
import 'package:col/ui/home/inspection_application/model/dropdown_model.dart';
import 'package:col/ui/home/inspection_application/model/inspection_response_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/auth/model/LoginResponse.dart';
import '../ui/home/inspection_application/model/InspectionListsModel.dart';
import '../ui/home/inspection_application/model/Inspection_list_response_model.dart';
// import 'package:/ui/auth/model/login_response_dto.dart';

class PreferencesManager {
  static const _keyUserID = 'keyUserID';
  static const _keyUserToken = 'keyUserToken';
  static const _keyEodCheckoutTime = 'keyEodCheckoutTime';
  static const _keyUserProfile = 'keyUserProfile';
  static const _keyInspectionList = 'keyInspectionList';
  static const _keyTalukaList = 'keyTalukaList';
  static const keyLanguageCode = 'language_code';
  static const keyIsGuestUser = 'guest_user';
  static const keyFullName = 'name';
  static const keyEmail = 'email';
  static const keyIsTimeIN = 'isTimeIn';
  static const keyInspectionDetails = 'keyInspectionDetails';
  static const keyInspectionViewDetails = 'keyInspectionViewDetails';
  static const isPermissionPopShown = 'is_permission_pop_shown';
  static const isAllTimePermissionPopShown = 'is_all_time_permission_pop_shown';

  Future<bool> isLoggedIn() async {
    final preferences = await _getPreferences();
    return preferences.containsKey(_keyUserID) && preferences.containsKey(_keyUserProfile);
  }

  Future<bool> isGuestUser() async {
    final preferences = await _getPreferences();
    return preferences.getBool(keyIsGuestUser) ?? false;
  }

  void setGuestUser(bool isGuestUser) async {
    (await _getPreferences()).setBool(keyIsGuestUser, isGuestUser);
  }

  Future<SharedPreferences> _getPreferences() async => await SharedPreferences.getInstance();

  Future<int?> getEmpUSerID() async {
    return (await _getPreferences()).getInt(_keyUserID);
  }

  Future<String?> getUSerToken() async {
    return (await _getPreferences()).getString( _keyUserToken);
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

  // Get [String] from the [SharedPreferences]
  Stream<int?> getInt(String key) {
    return _getSharedPreference().map((preference) => preference.getInt(key));
  }

  /// Set [String] to the [SharedPreferences]
  Stream<bool> setInt(String key, int value) {
    return _getSharedPreference().flatMap((preference) => _convertToRx(preference.setInt(key, value)));
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



  void setUserProfile(LoginResponse user) async {
    if (user == null) {
      (await _getPreferences()).remove(_keyUserProfile);
    } else {
      final userJson = jsonEncode(user.toJson());
      (await _getPreferences()).setString(_keyUserProfile, userJson);
    }
  }

  void setInspectionList(List<InspectionListsModel> user) async {

    print("SetInspectionList :- $user");
    if (user.isEmpty) {
      (await _getPreferences()).remove(_keyInspectionList);
    } else {
      (await _getPreferences()).setString(_keyInspectionList, json.encode(user));
    }
  }

  void setTalukaList(List<DropDownResponseModel> TalukaList) async {

    print("setTalukaList :- $TalukaList");
    if (TalukaList.isEmpty) {
      (await _getPreferences()).remove(_keyTalukaList);
    } else {
      (await _getPreferences()).setString(_keyTalukaList, json.encode(TalukaList));
    }
  }

  void setEmpUSerID(int? userID) async {
    if (userID == null) {
      (await _getPreferences()).remove(_keyUserID);
    } else {
      (await _getPreferences()).setInt(_keyUserID, userID);
    }
  }

  void setInspectionDetails(String? inspectionDetails) async {
    if (inspectionDetails == null) {
      (await _getPreferences()).remove(keyInspectionDetails);
    } else {
      (await _getPreferences()).setString(keyInspectionDetails, inspectionDetails);
    }
  }

  void setInspectionViewDetails(String? inspectionDetails) async {
    if (inspectionDetails == null) {
      (await _getPreferences()).remove(keyInspectionViewDetails);
    } else {
      (await _getPreferences()).setString(keyInspectionViewDetails, inspectionDetails);

    }
  }

  Future<String?> getInspectionDetails() async {
    return (await _getPreferences()).getString(keyInspectionDetails);
  }

  Future<String?> getInspectionViewDetails() async {
    return (await _getPreferences()).getString(keyInspectionViewDetails);
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

  Future<LoginResponse?> getUserProfile() async {
    final userJson = (await _getPreferences()).getString(_keyUserProfile);
    if (userJson == null || userJson.isEmpty) {
      return null;
    }

    try {
      final userMap = jsonDecode(userJson);
      var userDto = LoginResponse.fromJson(userMap);
      return userDto;
    } catch (exception) {
      return null;
    }
  }

  Future<List<DropDownResponseModel>?> getTalukaList() async {
    final userJson = (await _getPreferences()).getString(_keyTalukaList);
    if (userJson == null || userJson.isEmpty) {
      return null;
    }

    try {
      // Convert the string back to a list of JSON maps
      List<dynamic> TalukaList = json.decode(userJson);
      // Convert the list of JSON maps back to a list of InspectionModel objects
      List<DropDownResponseModel> inspectionList = TalukaList
          .map((inspectionJson) => DropDownResponseModel.fromJson(inspectionJson))
          .toList();
      return inspectionList;
    } catch (exception) {
      return null;
    }
  }

  Future<List<InspectionListsModel>?> getInspectionList() async {
    final userJson = (await _getPreferences()).getString(_keyInspectionList);
    if (userJson == null || userJson.isEmpty) {
      return null;
    }

    try {
      // Convert the string back to a list of JSON maps
      List<dynamic> inspectionJsonList = json.decode(userJson);
      // Convert the list of JSON maps back to a list of InspectionModel objects
      List<InspectionListsModel> inspectionList = inspectionJsonList
          .map((inspectionJson) => InspectionListsModel.fromJson(inspectionJson))
          .toList();
      return inspectionList;
    } catch (exception) {
      return null;
    }
  }

  Future<void> removePreference(String key) async {
    // Implement the logic to remove the preference with the specified key
    // This might involve accessing some storage mechanism (e.g., SharedPreferences, database, etc.)
    // For example, if you're using SharedPreferences:
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}