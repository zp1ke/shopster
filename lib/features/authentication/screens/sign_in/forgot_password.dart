import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/logo_hero.dart';
import 'package:shopster/common/widgets/input/email_field.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/features/authentication/screens/sign_in/verify_email.dart';
import 'package:shopster/l10n/app_l10n.dart';

class ForgotPassword extends StatelessWidget {
  static const path = '/forgot-password';

  static GetPage route() {
    return GetPage(name: path, page: () => ForgotPassword());
  }

  const ForgotPassword({super.key});

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
        child: Column(
          spacing: AppSize.defaultSpacing,
          children: [
            Text(
              appL10n.signInResetPassword,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.end,
            ),
            Text(
              appL10n.signInResetPasswordSubtitle,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.end,
            ),
            emailField(context),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget closeButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(SignInScreen.path);
      },
      icon: const Icon(AppIcons.closeFilled),
    );
  }

  Widget emailField(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return EmailField(
      labelText: appL10n.signInEmail,
      hintText: appL10n.signInEnterEmail,
    );
  }

  Widget submitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          Get.toNamed(SignInVerifyScreen.path);
        },
        child: Text(AppL10n.of(context).signInForgotPasswordSubmit),
      ),
    );
  }
}
