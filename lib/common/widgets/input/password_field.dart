import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';

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
        prefixIcon: const Icon(AppIcons.passwordFilled, size: AppSize.iconXs),
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: Icon(
            obscure ? AppIcons.eyeOutline : AppIcons.eyeOffOutline,
            size: AppSize.iconXs,
          ),
        ),
      ),
      obscureText: obscure,
    );
  }
}
