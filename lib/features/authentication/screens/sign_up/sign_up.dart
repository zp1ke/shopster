import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/common/widgets/text_divider.dart';
import 'package:shopster/features/authentication/screens/sign_up/form.dart';
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
        title: Hero(
          tag: 'logo-header',
          child: Image(
            height: kToolbarHeight * 0.8,
            image: AssetImage(AppImage.logo(context)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.defaultSpacing),
        child: PageBoxWidget(
          child: Column(
            spacing: AppSize.defaultSpacing,
            children: [
              Text(
                appL10n.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.end,
              ),
              SignUpForm(),
              TextDividerWidget(
                padding: EdgeInsets.all(AppSize.itemSpacing),
                text: appL10n.signUpOrDivider,
              ),
              SocialSignInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
