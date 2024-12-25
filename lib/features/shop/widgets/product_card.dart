import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/image_rounded.dart';
import 'package:shopster/common/widgets/rounded_container.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/product.dart';

class ProductCardVertical extends StatelessWidget {
  final ShopProduct product;
  final double size;

  const ProductCardVertical({
    super.key,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: size,
      decoration: BoxDecoration(
        boxShadow: [theme.productShadow],
        borderRadius: BorderRadius.circular(AppSize.itemSpacing),
        color: theme.canvasColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          details(context),
          Container(
            padding: EdgeInsets.only(
              top: AppSize.itemSpacing,
              left: AppSize.itemSpacing / 2,
            ),
            child: priceWidget(context),
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    final theme = Theme.of(context);
    final positionPadding = AppSize.productCardPadding / 2;
    return RoundedContainer(
      height: size,
      padding: EdgeInsets.all(AppSize.productCardPadding),
      backgroundColor: theme.cardColor,
      radius: AppSize.itemSpacing,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ImageRounded(product.imageUrl),
          ),
          if (product.discountPercent != null)
            Positioned(
              top: positionPadding,
              left: positionPadding,
              child: discountWidget(context),
            ),
          Positioned(
            top: positionPadding,
            right: positionPadding,
            child: favButton(context),
          ),
        ],
      ),
    );
  }

  Widget discountWidget(BuildContext context) {
    final theme = Theme.of(context);
    return RoundedContainer(
      radius: AppSize.productCardPadding,
      backgroundColor: theme.colorScheme.app.warning.withValues(alpha: 0.8),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.itemSpacing / 4,
        vertical: AppSize.itemSpacing / 5,
      ),
      child: Text(
        '${product.discountPercent}%',
        style: theme.textTheme.labelLarge
            ?.apply(color: theme.colorScheme.app.onWarning),
      ),
    );
  }

  Widget favButton(BuildContext context) {
    final theme = Theme.of(context);
    return RoundedContainer(
      backgroundColor: theme.cardColor,
      radius: AppSize.buttonRadius,
      child: IconButton(
        onPressed: () {},
        visualDensity: VisualDensity.compact,
        icon: Icon(
          product.isFav ? AppIcons.heartFilled : AppIcons.heartOutline,
          color: theme.colorScheme.error,
        ),
      ),
    );
  }

  Widget details(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.productCardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productName(context),
          brandWidget(context, product.brand),
        ],
      ),
    );
  }

  Widget productName(BuildContext context) {
    return Text(
      product.name,
      style: Theme.of(context).textTheme.labelLarge,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }

  Widget brandWidget(BuildContext context, ShopBrand brand) {
    final theme = Theme.of(context);
    return Row(
      spacing: AppSize.productCardPadding / 2,
      children: [
        if (brand.isVerified)
          Icon(
            AppIcons.verifiedFilled,
            color: theme.primaryColor,
            size: AppSize.iconXs,
          ),
        Expanded(
          child: Text(
            brand.name,
            style:
                theme.textTheme.labelMedium?.apply(color: theme.disabledColor),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget priceWidget(BuildContext context) {
    return Row(
      spacing: AppSize.productCardPadding,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        price(context),
        addedIcon(context),
      ],
    );
  }

  Widget price(BuildContext context) {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      style: Theme.of(context).textTheme.headlineSmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget addedIcon(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.productCardPadding),
          bottomRight: Radius.circular(AppSize.productCardPadding),
        ),
      ),
      child: SizedBox(
        width: AppSize.sectionSpacing,
        height: AppSize.sectionSpacing,
        child: Center(
          child: Icon(
            AppIcons.addFilled,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
