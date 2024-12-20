import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/logo_hero.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/common/widgets/text_divider.dart';
import 'package:shopster/features/authentication/screens/sign_up/form.dart';
import 'package:shopster/features/authentication/screens/sign_up/verify_email.dart';
import 'package:shopster/features/authentication/widgets/social_sign_in.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignUpScreen extends StatelessWidget {
  static const path = '/sign-up';

  static GetPage route() {
    return GetPage(name: path, page: () => SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: LogoHero(height: AppSize.logoAppbarSize),
      ),
      body: PageBoxWidget(
        child: Column(
          spacing: AppSize.defaultSpacing,
          children: [
            Text(
              appL10n.signUpTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.end,
            ),
            SignUpForm(onSignUp: () {
              Get.toNamed(VerifyEmailScreen.path);
            }),
            TextDividerWidget(
              padding: EdgeInsets.all(AppSize.itemSpacing),
              text: appL10n.signUpOrDivider,
            ),
            SocialSignInWidget(),
          ],
        ),
      ),
    );
  }
}
