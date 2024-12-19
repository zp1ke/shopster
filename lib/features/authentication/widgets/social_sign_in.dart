import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopster/common/styles/sizes.dart';

class SocialSignInWidget extends StatelessWidget {
  const SocialSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.itemSpacing,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleButton(),
        facebookButton(),
      ],
    );
  }

  Widget googleButton() {
    return IconButton.outlined(
      onPressed: () {},
      icon: FaIcon(FontAwesomeIcons.google),
    );
  }

  Widget facebookButton() {
    return IconButton.outlined(
      onPressed: () {},
      icon: FaIcon(FontAwesomeIcons.facebook),
    );
  }
}
