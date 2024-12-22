import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/l10n/app_l10n.dart';

class UserPage extends ShopPage {
  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.userOutline),
      selectedIcon: const Icon(AppIcons.userFilled),
      label: AppL10n.of(context).shopUser,
    );
  }

  @override
  Widget buildWidget() {
    return Container(color: Colors.green);
  }
}
