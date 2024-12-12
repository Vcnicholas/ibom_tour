import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  var isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void handleError(String error) {
    print('Error: $error');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
