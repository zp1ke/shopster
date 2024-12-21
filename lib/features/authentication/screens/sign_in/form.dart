import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/email_field.dart';
import 'package:shopster/common/widgets/password_field.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignInForm extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onForgotPassword;

  const SignInForm({
    super.key,
    required this.onSignIn,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Form(
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          EmailField(
            labelText: appL10n.signInEmail,
            hintText: appL10n.signInEnterEmail,
          ),
          PasswordField(
            labelText: appL10n.signInPassword,
            hintText: appL10n.signInEnterPassword,
          ),
          rememberMeForgotPassword(context),
          signInButton(context),
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
        SizedBox(
          width: AppSize.itemSpacing,
          height: AppSize.defaultSpacing,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        Text(AppL10n.of(context).signInRememberMe),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: onForgotPassword,
      child: Text(AppL10n.of(context).signInForgotPassword),
    );
  }

  Widget signInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onSignIn,
        child: Text(AppL10n.of(context).signInAction),
      ),
    );
  }
}
