import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/text_divider.dart';
import 'package:shopster/features/authentication/screens/sign_in/form.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignInScreen extends StatelessWidget {
  static const path = '/sign-in';

  static GetPage route() {
    return GetPage(name: path, page: () => SignInScreen());
  }

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.defaultSpacing),
        child: Column(
          spacing: AppSize.defaultSpacing,
          children: [
            header(context),
            SignInForm(),
            TextDividerWidget(text: AppL10n.of(context).signInOrDivider),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appL10n = AppL10n.of(context);
    return Column(
      spacing: AppSize.itemSpacing,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image(
          height: AppSize.logoSize,
          image: AssetImage(AppImage.logo(context)),
        ),
        Text(
          appL10n.signInTitle,
          style: textTheme.headlineMedium,
        ),
        Text(
          appL10n.signInSubtitle,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
