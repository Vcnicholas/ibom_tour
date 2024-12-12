import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ibom_tour/apis/model/response/auth_response.dart';
import 'package:ibom_tour/services/hive_service.dart';
import '../apis/providers/api_provider.dart';
import '../constants/strings.dart';
import '../services/storage_service.dart';
import '../utils/app_utility.dart';

class AuthService extends GetxService{
  final _apiProvider = ApiProvider(http.Client());
  int _deviceId = 0;
  int _expiresAt = 0;
  bool _isLoggedIn = false;
   String _token = '';
     AuthResponse _loginData = AuthResponse();

    @override
  void onInit() {
    AppUtility.log("AuthService Initializing");
    super.onInit();
    getDeviceId();
    AppUtility.log("AuthService Initialized");
  }

  static AuthService get find => Get.find();
  AuthResponse get loginData => _loginData;

  /// Setters


    /// Getters
  String get token => _token;

  int? get deviceId => _deviceId;

  int get expiresAt => _expiresAt;

  bool get isLoggedIn => _isLoggedIn;

  /// Setters
  set setLoginData(AuthResponse value) => _loginData = value;

  set setToken(String value) => _token = value;

  set setExpiresAt(int value) => _expiresAt = value;

  set setDeviceId(int value) => _deviceId = value;
  
  Future<String> getToken() async {
    var authToken = '';
    final decodedData = await readLoginDataFromLocalStorage();
    if (decodedData != null) {
      setExpiresAt = decodedData[StringValues.expiresAt];
      setToken = decodedData[StringValues.token];
      authToken = decodedData[StringValues.token];
      _isLoggedIn = true;
    }
    return authToken;
  }

   Future<void> deleteAllLocalDataAndCache() async {
    await StorageService.remove('loginData');
    await StorageService.remove('profileData');
    await StorageService.remove("fcmToken");
    await HiveService.deleteAllBoxes();
    AppUtility.log('Local Data Removed');
  }

  Future<Map<String, dynamic>?> readLoginDataFromLocalStorage() async {
    var hasData = await StorageService.hasData('loginData');

    if (hasData) {
      AppUtility.log('Login Data Found');
      var data = StorageService.read('loginData') as Map<String, dynamic>;
      return data;
    } else {
      AppUtility.log('No Login Data Found', tag: 'error');
      return null;
    }
  }
  
  Future<void> saveLoginDataToLocalStorage(String token, int expiresAt) async {
    if (token.isEmpty && expiresAt <= 0) {
      AppUtility.log('Token or ExpiresAt is empty', tag: 'error');
      return;
    }

    final data = {
      StringValues.token: token,
      StringValues.expiresAt: expiresAt,
    };

    await StorageService.write('loginData', data);
    AppUtility.log('Login Data Saved to Local Storage');
  }

  Future<void> saveFcmTokenToLocalStorage(String fcmToken) async {
    if (fcmToken.isEmpty) {
      AppUtility.log('Fcm Token is empty', tag: 'error');
      return;
    }

    await StorageService.write('fcmToken', base64Encode(fcmToken.codeUnits));
    AppUtility.log('Fcm Token Saved to Local Storage');
  }

  Future<String> readFcmTokenFromLocalStorage() async {
    var hasData = await StorageService.hasData('fcmToken');

    if (hasData) {
      AppUtility.log('Fcm Token Found');
      var data = StorageService.read('fcmToken');
      return String.fromCharCodes(base64Decode(data));
    } else {
      AppUtility.log('No Fcm Token Found', tag: 'error');
      return '';
    }
  }
  
  Future<void> getDeviceId() async {
    final devData = GetStorage();

    var savedDevId = devData.read('deviceId');

    try {
      setDeviceId = int.parse(savedDevId);
    } catch (err) {
      var devId = generateDeviceId();
      await devData.write('deviceId', devId);
      var savedDevId = devData.read('deviceId');
      setDeviceId = int.parse(savedDevId);
    }
  }

  String generateDeviceId() {
    const chars = '1234567890';
    var rnd = Random();

    var devId = String.fromCharCodes(
      Iterable.generate(
        16,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );

    return devId;
  }
  
}