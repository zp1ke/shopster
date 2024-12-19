import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  const EmailField({
    super.key,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.at),
        labelText: labelText,
        hintText: hintText,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
