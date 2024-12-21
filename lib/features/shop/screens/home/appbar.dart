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
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppL10n.of(context).shopHomeTitle,
          style: textTheme.labelMedium?.copyWith(
            color: AppTheme.shopHeaderForegroundColor(context)
                .withValues(alpha: 0.4),
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          'TODO Name',
          style: textTheme.headlineSmall?.copyWith(
            color: AppTheme.shopHeaderForegroundColor(context),
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
