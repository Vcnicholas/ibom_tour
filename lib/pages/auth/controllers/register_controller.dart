import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../apis/providers/api_provider.dart';

class RegisterController extends GetxController {
  static RegisterController get find => Get.find();

  final _apiProvider = ApiProvider(http.Client());

  final fNameTextController = TextEditingController();
  final lNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final unameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final FocusScopeNode otpFocusNode = FocusScopeNode();

  final _isLoading = false.obs;
  final _showPassword = true.obs;
  // final _showConfirmPassword = true.obs;
  final _isOtpSent = false.obs;
  final _isEmailVerified = false.obs;
  final _otp = List.empty(growable: true)..length = 6;

  Timer? resendTimer;
  int resendTimerSec = 59;
  int resendTimerMin = 0;
  bool isSent = false;
  bool _isNotEmpty = false;
  bool _hasCapital = false;

  bool _hasNumbers = false;
  bool _hasSpecialCharacters = false;
  bool _has8 = false;

  bool get isNotEmpty => _isNotEmpty;
  bool get hasCapital => _hasCapital;
  bool get hasNumbers => _hasNumbers;
  bool get hasPecialCharacters => _hasSpecialCharacters;
  bool get has8 => _has8;

  bool get isLoading => _isLoading.value;
  bool get showPassword => _showPassword.value;
  // bool get showConfirmPassword => _showConfirmPassword.value;
  bool get isOtpSent => _isOtpSent.value;
  bool get isEmailVerified => _isEmailVerified.value;
  String get otp => _otp.join();

  void validatePassword(String value) {
    final hasCapitalLetter = value.contains(RegExp(r'[A-Z]'));
    final hasNumber = value.contains(RegExp(r'\d'));
    final hasSpecialCharacter =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (value.isNotEmpty) {
      _isNotEmpty = true;
    } else {
      _isNotEmpty = false;
    }
    if (hasCapitalLetter) {
      _hasCapital = true;
    } else {
      _hasCapital = false;
    }
    if (hasNumber) {
      _hasNumbers = true;
    } else {
      _hasNumbers = false;
    }
    if (hasSpecialCharacter) {
      _hasSpecialCharacters = true;
    } else {
      _hasSpecialCharacters = false;
    }
    if (value.length > 7) {
      _has8 = true;
    } else {
      _has8 = false;
    }
    update();
  }

String selectedAwareness = '';

  void onOtpChanged(String value, int index) {
    _otp[index] = value;
    update();
  }

  void _clearOtpFields() {
    _otp.clear();
    resetTimer();
    update();
  }

  void startTimer() {
    resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTimerSec--;
      update();
      // if (resendTimerSec > 15) {
      //   // resendTimerSec = 0;
      //   resendTimerMin--;
      //   update();
      // }
      if (resendTimerSec == 0) {
        resendTimerSec = 59;
        // resendTimerMin = 0;
        timer.cancel();
        update();
      }
    });
  }

  void sentOTP() {
    isSent = true;
    Future.delayed(Duration(seconds: 60), () {
      isSent = false;
      print('Executed after 2 seconds');
      update();
    });
    update();
  }

  void resetTimer() {
    resendTimerSec = 0;
    resendTimerMin = 0;
    resendTimer?.cancel();
  }

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }
  List<String> awarenessMethod = [
    '',
    'Facebook',
    'Instagram',
    'Tiktok',
    'X (Formerly Twitter)',
    'Somebody told me',
    'YouTube',
    'WhatsApp',
    'Other',];

  // void toggleViewConfirmPassword() {
  //   _showConfirmPassword(!_showConfirmPassword.value);
  //   update();
  // }

  void _clearRegisterTextControllers() {
    fNameTextController.clear();
    lNameTextController.clear();
    emailTextController.clear();
    unameTextController.clear();
    passwordTextController.clear();

    _otp.clear();
  }
}
