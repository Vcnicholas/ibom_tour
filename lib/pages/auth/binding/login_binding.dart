import 'package:get/get.dart';
import 'package:ibom_tour/pages/auth/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginController.new, fenix: true);
  }
}
