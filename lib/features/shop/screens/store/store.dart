import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/l10n/app_l10n.dart';

class StorePage extends ShopPage {
  static const pageId = 'store';

  @override
  String get id => pageId;

  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.storeOutline),
      selectedIcon: const Icon(AppIcons.storeFilled),
      label: AppL10n.of(context).shopStore,
    );
  }

  @override
  Widget buildWidget() {
    return Container(color: Colors.deepOrange);
  }
}
