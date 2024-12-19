import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/email_field.dart';
import 'package:shopster/common/widgets/password_field.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Form(
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          EmailField(hintText: appL10n.signInEmail),
          PasswordField(hintText: appL10n.signInPassword),
          rememberMeForgotPassword(context),
          signInButton(context),
          signUpButton(context),
        ],
      ),
    );
  }

  Widget rememberMeForgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rememberMeSwitch(context),
        forgotPasswordButton(context),
      ],
    );
  }

  Widget rememberMeSwitch(BuildContext context) {
    return Row(
      spacing: AppSize.itemSpacing,
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        Text(AppL10n.of(context).signInRememberMe),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(AppL10n.of(context).signInForgotPassword),
    );
  }

  Widget signInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(AppL10n.of(context).signInAction),
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(AppL10n.of(context).signUpAction),
      ),
    );
  }
}
