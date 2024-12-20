import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image_text.dart';
import 'package:shopster/common/widgets/logo_hero.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/features/authentication/screens/sign_up/success.dart';
import 'package:shopster/l10n/app_l10n.dart';

class VerifyEmailScreen extends StatelessWidget {
  static const path = '/sign-up-verify';

  static GetPage route() {
    return GetPage(name: path, page: () => VerifyEmailScreen());
  }

  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: LogoHero(height: AppSize.logoAppbarSize),
        actions: [
          closeButton(context),
        ],
      ),
      body: PageBoxWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSize.defaultSpacing),
          child: Column(
            spacing: AppSize.itemSpacing,
            children: [
              ImageTextWidget(
                image: AppImage.signUpVerify,
                title: appL10n.signUpVerifyEmailTitle,
                subtitle: 'todo@mail.com',
                // TODO: replace with real email
                subtitleStyle: textTheme.labelLarge,
                padding: EdgeInsets.zero,
              ),
              Text(
                appL10n.signUpVerifyEmailSubtitle,
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              continueButton(context),
              resendEmailButton(context),
            ],
          ),
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

  Widget continueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {},
        child: Text(AppL10n.of(context).signUpVerifyContinue),
      ),
    );
  }

  Widget resendEmailButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Get.toNamed(SignUpSuccessScreen.path);
        },
        child: Text(AppL10n.of(context).signUpVerifyResendEmail),
      ),
    );
  }
}
