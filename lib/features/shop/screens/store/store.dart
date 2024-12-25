import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/section_heading.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/widgets/brand_card.dart';
import 'package:shopster/features/shop/widgets/index.dart';
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
    return _StoreScreen();
  }
}

class _StoreScreen extends StatelessWidget {
  final brands = List<ShopBrand>.generate(4, (index) {
    return ShopBrand(
      name: 'Brand ${index + 1}',
      imageUrl: AppImage.fakeImageUrl(width: 64, text: 'BRAND-${index + 1}'),
      isVerified: index % 3 == 0,
      productsAmount: 10 + index * 3,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return ShopAppBar(
      titleText: AppL10n.of(context).shopStore,
      backgroundColor: Theme.of(context).canvasColor,
      actions: [
        ShopCartButton(),
      ],
    );
  }

  Widget body() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: Theme.of(context).canvasColor,
            expandedHeight: AppSize.storeAppBarHeight,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpacing),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ShopSearchBar(
                      hintText: AppL10n.of(context).shopStoreSearchHint),
                  featuresBrandsHeader(context),
                  featuresBrands(context),
                ],
              ),
            ),
          ),
        ];
      },
      body: Container(),
    );
  }

  Widget featuresBrandsHeader(BuildContext context) {
    return SectionHeadingWidget(
      title: AppL10n.of(context).shopStoreFeaturedBrands,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      actionTitle: AppL10n.of(context).shopStoreViewAllCategories,
      onAction: () {},
    );
  }

  Widget featuresBrands(BuildContext context) {
    var cardWidth = AppSize.productCardWidth;
    final screenWidth =
        MediaQuery.of(context).size.width - AppSize.itemSpacing * 2;
    if (screenWidth / cardWidth < 2) {
      cardWidth = max(screenWidth / 2, AppSize.productCardMinWidth);
    }
    return Wrap(
      spacing: AppSize.itemSpacing,
      runSpacing: AppSize.itemSpacing,
      children: brands
          .map((brand) =>
              BrandCard(brand: brand, size: cardWidth - AppSize.itemSpacing))
          .toList(growable: false),
    );
  }
}
