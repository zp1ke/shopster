import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image_text.dart';
import 'package:shopster/common/widgets/logo_hero.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignUpSuccessScreen extends StatelessWidget {
  static const path = '/sign-up-success';

  static GetPage route() {
    return GetPage(name: path, page: () => SignUpSuccessScreen());
  }

  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: LogoHero(height: AppSize.logoAppbarSize),
      ),
      body: PageBoxWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSize.defaultSpacing),
          child: Column(
            spacing: AppSize.itemSpacing,
            children: [
              ImageTextWidget(
                image: AppImage.signUpSuccess,
                title: appL10n.signUpSuccessTitle,
                subtitle: appL10n.signUpSuccessSubtitle,
                subtitleStyle: textTheme.labelMedium,
              ),
              continueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget continueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          Get.offAllNamed(SignInScreen.path);
        },
        child: Text(AppL10n.of(context).signUpVerifyContinue),
      ),
    );
  }
}
