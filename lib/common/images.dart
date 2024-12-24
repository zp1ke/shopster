import 'package:flutter/material.dart';

class AppImage {
  AppImage._();

  static String fakeImageUrl({required int width, int? height, String? text}) {
    var url = 'https://fakeimg.pl/${width}x${height ?? width}';
    if (text != null) {
      url += '/?text=$text';
    }
    return url;
  }

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

  static const String _animationsPath = 'assets/animations';
  static const String _imagesPath = 'assets/images';

  // onboarding
  static const String _onBoardingPath = '$_imagesPath/on_boarding';
  static const String onboardingDelivery = '$_onBoardingPath/delivery.gif';
  static const String onboardingSearching = '$_onBoardingPath/searching.gif';
  static const String onboardingShopping = '$_onBoardingPath/shopping.gif';
  static const String _onBoardingAnimationPath = '$_animationsPath/on_boarding';
  static const String onboardingAnimationSearching =
      '$_onBoardingAnimationPath/searching.json';
  static const String onboardingAnimationShopping =
      '$_onBoardingAnimationPath/shopping.json';
  static const String onboardingAnimationDelivery =
      '$_onBoardingAnimationPath/delivery.json';

  // sign up
  static const String _signUpPath = '$_imagesPath/sign_up';
  static const String signUpVerify = '$_signUpPath/verify.png';
  static const String signUpSuccess = '$_signUpPath/success.png';
}
