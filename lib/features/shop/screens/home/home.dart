import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/screens/home/app_bar.dart';
import 'package:shopster/features/shop/widgets/shop_header.dart';
import 'package:shopster/features/shop/widgets/shop_search_bar.dart';
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
    return Column(
      children: [
        ShopHeaderWidget(
          child: Column(
            spacing: AppSize.itemSpacing,
            children: [
              HomeAppBar(subtitle: 'TODO NAME'),
              ShopSearchBar(hintText: AppL10n.of(context).shopHomeSearchHint),
            ],
          ),
        ),
        Center(
          child: Text('HOME TODO'),
        ),
      ],
    );
  }
}
