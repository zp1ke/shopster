import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailField extends StatelessWidget {
  final String? hintText;

  const EmailField({
    super.key,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: FaIcon(FontAwesomeIcons.at),
        hintText: hintText,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
