import 'package:get/get.dart';
import 'package:ibom_tour/pages/dashboard/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new, fenix: true);
  }
}
