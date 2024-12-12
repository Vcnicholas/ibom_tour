import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycController extends GetxController {
  static KycController get find => Get.find();
  File? nin;
  final ImagePicker _picker = ImagePicker();
  bool isNin = false;

  //final _auth = AuthService.find;

  final TextEditingController bvn = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController pin = TextEditingController();
  final TextEditingController confirmPin = TextEditingController();
  String selectedCountry = 'Nigeria';
  bool pinConfirmed = true;

List<String> idTypes = ['NIN (National Identification Number)', 'BVN(Bank Verification Number)'];
String selectedIDType = '';

  Future<void> selectNin() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      nin = File(pickedFile!.path);
      update();
    }
  }
  void validatePin (value) {
    if(value != pin.text){
      pinConfirmed = false;
    }else{
      pinConfirmed = true;
    }
    update();


  }
}
