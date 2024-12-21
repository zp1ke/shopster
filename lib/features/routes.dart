import 'package:get/get.dart';
import 'package:shopster/features/authentication/screens/on_boarding.dart';
import 'package:shopster/features/authentication/screens/sign_in/forgot_password.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/features/authentication/screens/sign_in/verify_email.dart';
import 'package:shopster/features/authentication/screens/sign_up/sign_up.dart';
import 'package:shopster/features/authentication/screens/sign_up/success.dart';
import 'package:shopster/features/authentication/screens/sign_up/verify_email.dart';
import 'package:shopster/features/shop/screens/shop.dart';

List<GetPage> appRoutes() {
  return [
    OnBoardingScreen.route(),
    SignInScreen.route(),
    ForgotPassword.route(),
    SignInVerifyScreen.route(),
    SignUpScreen.route(),
    SignUpVerifyScreen.route(),
    SignUpSuccessScreen.route(),
    ShopScreen.route(),
  ];
}
