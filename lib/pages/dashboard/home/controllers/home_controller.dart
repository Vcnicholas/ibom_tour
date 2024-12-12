import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../constants/assets.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController amount = TextEditingController();
  File? nin;
  bool showBalance = true;
  final ImagePicker _picker = ImagePicker();
  int selectedIndex = -1;
  String selectedNetwork = '';
  bool selected = true;
  String phoneNumber = '';

  //final _auth = AuthService.find;

  final TextEditingController bvn = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController pin = TextEditingController();
  final TextEditingController confirmPin = TextEditingController();

  List<String> serviceIcon = [
    AssetValues.airtime,
    AssetValues.dataBundle,
    AssetValues.betting,
    AssetValues.cableTV
  ];
  List<String> service = ['Airtime', 'Data Bundle', 'Betting', 'Cable TV'];
  List<String> allServices = [
    'Airtime',
    'Data',
    'Cable TV',
    'Electricity',
    'Education',
    'International Airtime',
    'Internet',
    'Betting'
  ];
  List<String> networks = ['MTN', 'Airtel', 'Glo', '9 Mobile'];
  List<String> networkImage = [
    AssetValues.MTN,
    AssetValues.airtel,
    AssetValues.glo,
    AssetValues.etisalat
  ];
  List<String> airtimeAmounts = [
    '50',
    '100',
    '200',
    '500',
    '1000',
    '1500',
    '2000',
    '3000',
    '5000',
  ];
  List<Color> serviceColors = [
    Color(0xFFFFF5E3),
    Color(0XFFEAEDFF),
    Color(0xFFD9F8F1),
    Color(0xFFF9DEE2),
    Color(0xFFEEF6E1),
    Color(0xFFEBEEF5),
    Color(0xFFEEF0FF),
    Color(0xFFE6E6E6),
  ];
  List<String> allAServiceIcons = [
    ImageIcons.airtime,
    ImageIcons.electricity,
    ImageIcons.data,
    ImageIcons.betting,
    ImageIcons.bulkSMS,
    ImageIcons.intlAirtime,
    ImageIcons.internet,
    ImageIcons.cableTV
  ];

  void selectAmount(index) {
    selectedIndex = index;
    amount.text = airtimeAmounts[selectedIndex];
    selected = false;
    update();
  }

  void select(index) {
    selectedIndex = index;
    update();
  }

  @override
  void onClose() {
    pin.dispose();
    confirmPin.dispose();
    phoneNumberController.dispose();
    amount.dispose();
    super.onClose();
  }

  // Method to update the selected phone number
  void selectPhoneNumber(String phone) {
    phoneNumber = phone;
    update();
  }
}
