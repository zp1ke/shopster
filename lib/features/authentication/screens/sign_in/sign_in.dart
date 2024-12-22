import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/logo_header.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/common/widgets/text_divider.dart';
import 'package:shopster/features/authentication/screens/sign_in/forgot_password.dart';
import 'package:shopster/features/authentication/screens/sign_in/form.dart';
import 'package:shopster/features/authentication/screens/sign_up/sign_up.dart';
import 'package:shopster/features/authentication/widgets/social_sign_in.dart';
import 'package:shopster/features/shop/screens/shop.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignInScreen extends StatelessWidget {
  static const path = '/sign-in';

  static GetPage route() {
    return GetPage(name: path, page: () => SignInScreen());
  }

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Scaffold(
      body: PageBoxWidget(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.defaultSpacing,
          vertical: AppSize.itemSpacing,
        ),
        child: Column(
          spacing: AppSize.defaultSpacing,
          children: [
            LogoHeaderWidget(
              title: appL10n.signInTitle,
              subtitle: appL10n.signInSubtitle,
            ),
            SignInForm(
              onSignIn: () {
                Get.offAllNamed(ShopScreen.path);
              },
              onForgotPassword: () {
                Get.toNamed(ForgotPassword.path);
              },
            ),
            signUpButton(context),
            TextDividerWidget(
              padding: EdgeInsets.all(AppSize.itemSpacing),
              text: appL10n.signInOrDivider,
            ),
            SocialSignInWidget(),
          ],
        ),
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Get.toNamed(SignUpScreen.path);
        },
        child: Text(AppL10n.of(context).signUpAction),
      ),
    );
  }
}
