import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String title;
  final Color foregroundColor;
  final String? actionTitle;
  final VoidCallback? onAction;

  const SectionHeadingWidget({
    super.key,
    required this.title,
    required this.foregroundColor,
    this.actionTitle,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.itemSpacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: foregroundColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (actionTitle != null)
          TextButton(
            onPressed: onAction,
            child: Text(
              actionTitle!,
              style: TextStyle(
                color: foregroundColor.withValues(alpha: 0.4),
              ),
            ),
          ),
      ],
    );
  }
}
