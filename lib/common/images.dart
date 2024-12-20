import 'package:flutter/material.dart';

class AppImage {
  AppImage._();

  static const String _logosPath = 'assets/logos';

  // app
  static const String lightLogo = '$_logosPath/splash-light.png';
  static const String darkLogo = '$_logosPath/splash-dark.png';

  static String logo(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    if (Brightness.light == brightness) {
      return lightLogo;
    }
    return darkLogo;
  }

  // onboarding
  static const String _onBoardingPath = 'assets/images/on_boarding';
  static const String onboardingDelivery = '$_onBoardingPath/delivery.gif';
  static const String onboardingSearching = '$_onBoardingPath/searching.gif';
  static const String onboardingShopping = '$_onBoardingPath/shopping.gif';

  // sign up
  static const String _signUpPath = 'assets/images/sign_up';
  static const String signUpVerify = '$_signUpPath/verify.png';
  static const String signUpSuccess = '$_signUpPath/success.png';
}
