import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class TextDividerWidget extends StatelessWidget {
  final String text;

  const TextDividerWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppSize.sectionSpacing),
        Flexible(
          child: Divider(
            color: theme.hintColor,
            indent: AppSize.sectionSpacing,
            endIndent: AppSize.defaultSpacing,
          ),
        ),
        Text(
          text,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.hintColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Flexible(
          child: Divider(
            color: theme.hintColor,
            indent: AppSize.defaultSpacing,
            endIndent: AppSize.sectionSpacing,
          ),
        ),
      ],
    );
  }
}
