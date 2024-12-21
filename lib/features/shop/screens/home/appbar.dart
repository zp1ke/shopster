import 'package:flutter/material.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/features/shop/widgets/shop_appbar.dart';
import 'package:shopster/features/shop/widgets/shop_cart_button.dart';
import 'package:shopster/l10n/app_l10n.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ShopAppbar(
      title: appbarTitle(context),
      actions: [
        ShopCartButton(),
      ],
    );
  }

  Widget appbarTitle(BuildContext context) {
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
          'TODO Name',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.app.shopHeaderForeground,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
