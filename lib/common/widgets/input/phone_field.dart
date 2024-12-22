import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';

class PhoneField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  const PhoneField({
    super.key,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(AppIcons.phoneFilled, size: AppSize.iconXs),
        labelText: labelText,
        hintText: hintText,
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
