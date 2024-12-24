import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/features/shop/widgets/index.dart';
import 'package:shopster/l10n/app_l10n.dart';

class HomeAppBar extends StatelessWidget {
  final String subtitle;

  const HomeAppBar({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ShopAppBar(
      title: appBarTitle(context),
      actions: [
        ShopCartButton(),
      ],
    );
  }

  Widget appBarTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppL10n.of(context).shopHomeTitle,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.app.shopHeaderForeground
                .withValues(alpha: 0.4),
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          subtitle,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.app.shopHeaderForeground,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
