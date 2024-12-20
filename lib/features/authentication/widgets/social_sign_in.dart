import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme_extension.dart';
import 'package:shopster/common/widgets/icons.dart';

class SocialSignInWidget extends StatelessWidget {
  const SocialSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.itemSpacing,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleButton(context),
        facebookButton(context),
      ],
    );
  }

  Widget googleButton(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {},
      icon: Icon(
        AppIcons.google,
        color: AppThemeColors.of(context).google,
      ),
    );
  }

  Widget facebookButton(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {},
      icon: Icon(
        AppIcons.facebook,
        color: AppThemeColors.of(context).facebook,
      ),
    );
  }
}
