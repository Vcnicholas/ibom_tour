import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ibom_tour/apis/providers/api_provider.dart';
import '../../../app_services/auth_service.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();

  //final _auth = AuthService.find;
  

  final _apiProvider = ApiProvider(http.Client());

  final emailUnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final _showPassword = true.obs;
  final _accountStatus = ''.obs;
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  String get accountStatus => _accountStatus.value;

  bool get showPassword => _showPassword.value;

  void _clearLoginTextControllers() {
    emailUnameTextController.clear();
    passwordTextController.clear();
  }

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }
}
