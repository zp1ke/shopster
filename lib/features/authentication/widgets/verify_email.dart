import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/image_text.dart';
import 'package:shopster/l10n/app_l10n.dart';

class VerifyEmailWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onVerify;
  final VoidCallback onResend;

  const VerifyEmailWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onVerify,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: AppSize.itemSpacing,
      children: [
        ImageTextWidget(
          image: AppImage.signUpVerify,
          title: title,
          subtitle: 'todo@mail.com',
          // TODO: replace with real email
          subtitleStyle: textTheme.labelLarge,
          padding: EdgeInsets.zero,
        ),
        Text(
          subtitle,
          style: textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        continueButton(context),
        resendEmailButton(context),
      ],
    );
  }

  Widget continueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onVerify,
        child: Text(AppL10n.of(context).signUpVerifyContinue),
      ),
    );
  }

  Widget resendEmailButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onResend,
        child: Text(AppL10n.of(context).signUpVerifyResendEmail),
      ),
    );
  }
}
