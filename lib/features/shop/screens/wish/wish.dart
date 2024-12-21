import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/icons.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/l10n/app_l10n.dart';

class WishPage extends ShopPage {
  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.heartOutline),
      selectedIcon: const Icon(AppIcons.heartFilled),
      label: AppL10n.of(context).shopWish,
    );
  }

  @override
  Widget buildWidget() {
    return Container(color: Colors.blue);
  }
}
