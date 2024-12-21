import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/icons.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/widgets/shop_header.dart';
import 'package:shopster/l10n/app_l10n.dart';

class HomePage extends ShopPage {
  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.homeOutline),
      selectedIcon: const Icon(AppIcons.homeFilled),
      label: AppL10n.of(context).shopHome,
    );
  }

  @override
  Widget buildWidget() {
    return _HomeScreen();
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBoxWidget(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ShopHeaderWidget(
            child: Center(
              child: Text('HEADER TODO'),
            ),
          ),
          Center(
            child: Text('HOME TODO'),
          ),
        ],
      ),
    );
  }
}
