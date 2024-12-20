import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme_extension.dart';

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
      icon: FaIcon(
        FontAwesomeIcons.google,
        color: AppThemeColors.of(context).google,
      ),
    );
  }

  Widget facebookButton(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {},
      icon: FaIcon(
        FontAwesomeIcons.facebook,
        color: AppThemeColors.of(context).facebook,
      ),
    );
  }
}
