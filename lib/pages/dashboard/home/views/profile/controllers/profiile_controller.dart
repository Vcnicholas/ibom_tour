import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../../constants/assets.dart';

class ProfileController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  final TextEditingController passwordOTP = TextEditingController();

  List<String> generalSettings = [
    'Profile Settings',
    'Notification',
    'Add Bank',
    'Rewards'
  ];
  List<String> generalDesc = [
    'View your personal information',
    'Enable or disable push notifications',
    'Add your Bank accounts',
    'Get rewarded for inviting friends'
  ];
  List<String> security = [
    'Verifications',
    'Change Password',
    'PIN Management',
    'Biometrics'
  ];
  List<String> securityDesc = [
    'Verify your identity',
    'Update your password',
    'Change your payment pin',
    'Enable or disable biometrics'
  ];
  List<String> supportLegal = [
    'Help Center',
    'Privacy Policy',
    'Terms and Conditions'
  ];
  List<String> supportDesc = [
    'Get support or send feedback',
    'Review our privacy policy',
    'Read our Terms and Conditions'
  ];
  List<String> generalIcons = [
    AssetValues.profiles,
    ImageIcons.notifications,
    ImageIcons.bank,
    AssetValues.rewards,
  ];
  List<String> securityIcons = [
    ImageIcons.verifications,
    AssetValues.encrypted,
    ImageIcons.pinManagement,
    ImageIcons.biometric,
  ];
  List<String> supportLegalIcons = [
    ImageIcons.helpCenter,
    ImageIcons.privacy,
    ImageIcons.terms,
  ];
  List<Widget> generalScreens = [
 
  ];
  List<Widget> securityScreens = [
 
  ];
  List<Widget> supportScreens = [];

  bool isSwitched = false;
  var isAuthenticated = false.obs;  // Use RxBool for reactivity

  Future<void> authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face) to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      isAuthenticated.value = authenticated;  // Update reactive variable
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
