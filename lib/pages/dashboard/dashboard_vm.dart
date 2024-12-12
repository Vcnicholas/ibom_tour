import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import 'home/views/profile/views/profiles.dart';

class BottomNavViewModel extends GetxController {
  bool? isPremium;
  bool isButtonPressed = false;
  // UserResponse? userResponse;

  // int selectedPage = 0;
  // int limit=20;
  // int page=1;

  // void onNavigationItem(index) {
  //   selectedPage = index;
  //   notifyListeners();
  // }

  List<Widget> children = [
    // HomeView(),
    // Services(),
    // HomeView(),
    // HomeView(),
    // Profiles(),

  ];

  //Pops the app back
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
