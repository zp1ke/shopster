import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordField extends StatefulWidget {
  final String? labelText;
  final String? hintText;

  const PasswordField({
    super.key,
    this.labelText,
    this.hintText,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.key),
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: FaIcon(
            obscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          ),
        ),
      ),
      obscureText: obscure,
    );
  }
}
