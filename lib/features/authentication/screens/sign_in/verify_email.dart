import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/logo_hero.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/features/authentication/widgets/verify_email.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignInVerifyScreen extends StatelessWidget {
  static const path = '/sign-in-verify';

  static GetPage route() {
    return GetPage(name: path, page: () => SignInVerifyScreen());
  }

  const SignInVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: LogoHero(height: AppSize.logoAppbarSize),
        actions: [
          closeButton(context),
        ],
      ),
      body: PageBoxWidget(
        child: VerifyEmailWidget(
          title: appL10n.signInVerifyEmailTitle,
          subtitle: appL10n.signInVerifyEmailSubtitle,
          onVerify: () {
            Get.offAllNamed(SignInScreen.path);
          },
          onResend: () {},
        ),
      ),
    );
  }

  Widget closeButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(SignInScreen.path);
      },
      icon: const FaIcon(FontAwesomeIcons.xmark),
    );
  }
}
