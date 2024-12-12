import 'package:get/get.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/routes/routes_management.dart';

import '../../constants/assets.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get find => Get.find();
  int sliderIndex = 0;
  int totalSize = 3;

  List<OnBoardingData> onBoardingObjects = [
    OnBoardingData(
        image: AssetValues.onBoarding1,
        details: StringValues.onBording1,
        subtitle: StringValues.onBoardingSubtitle),
    OnBoardingData(
        image: AssetValues.onBoarding2,
        details: StringValues.onBoarding2,
        subtitle: StringValues.onBoardingSubtitle),
    OnBoardingData(
        image: AssetValues.onBoarding3,
        details: StringValues.onBoarding3,
        subtitle: StringValues.onBoardingSubtitle),
  ];

  changeCarouselIndexValue(int indexValue) {
    sliderIndex = indexValue;
    update();
  }

  goToUserType() {
    RouteManagement.goToSelectOption();
  }

  gotoLoginView(){
    RouteManagement.goToLoginView();
  }
}

class OnBoardingData {
  String image;
  String details;
  String? value;
  String subtitle;

  OnBoardingData(
      {required this.image,
      required this.details,
      this.value,
      required this.subtitle});
}
