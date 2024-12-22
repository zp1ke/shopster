import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/input/email_field.dart';
import 'package:shopster/common/widgets/input/password_field.dart';
import 'package:shopster/common/widgets/input/phone_field.dart';
import 'package:shopster/l10n/app_l10n.dart';

class SignUpForm extends StatelessWidget {
  final VoidCallback onSignUp;

  const SignUpForm({
    super.key,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Form(
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          nameField(context),
          EmailField(
            labelText: appL10n.signInEmail,
            hintText: appL10n.signInEnterEmail,
          ),
          PhoneField(
            labelText: appL10n.signUpPhone,
            hintText: appL10n.signUpEnterPhone,
          ),
          PasswordField(
            labelText: appL10n.signInPassword,
            hintText: appL10n.signInEnterPassword,
          ),
          termsAndConditions(context),
          signUpButton(context),
        ],
      ),
    );
  }

  Widget nameField(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return TextFormField(
      expands: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          AppIcons.userFilled,
          size: AppSize.iconXs,
        ),
        labelText: appL10n.signUpName,
        hintText: appL10n.signUpEnterName,
      ),
    );
  }

  Widget termsAndConditions(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return Row(
      spacing: AppSize.itemSpacing,
      children: [
        SizedBox(
          width: AppSize.itemSpacing,
          height: AppSize.defaultSpacing,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        Text(appL10n.signUpIAgree),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(appL10n.signUpTermsAndConditions),
        ),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(AppL10n.of(context).signInForgotPassword),
    );
  }

  Widget signUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onSignUp,
        child: Text(AppL10n.of(context).signUpAction),
      ),
    );
  }
}
