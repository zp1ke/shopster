import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class TextDividerWidget extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;

  const TextDividerWidget({
    super.key,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final row = Row(
      spacing: AppSize.itemSpacing,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: theme.hintColor),
        ),
        Text(
          text,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.hintColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Divider(color: theme.hintColor),
        ),
      ],
    );
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: row,
    );
  }
}
