import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/image.dart';
import 'package:shopster/features/shop/models/category.dart';

class ShopCategoriesWidget extends StatelessWidget {
  final String title;
  final Color foregroundColor;
  final List<ShopCategory> categories;
  final String? actionTitle;
  final VoidCallback? onAction;
  final Function(ShopCategory)? onCategory;

  const ShopCategoriesWidget({
    super.key,
    required this.title,
    required this.foregroundColor,
    required this.categories,
    this.actionTitle,
    this.onAction,
    this.onCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingWidget(context),
          categoriesWidget(context),
        ],
      ),
    );
  }

  Widget headingWidget(BuildContext context) {
    return Row(
      spacing: AppSize.itemSpacing,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: foregroundColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (actionTitle != null)
          TextButton(
            onPressed: onAction,
            child: Text(
              actionTitle!,
              style: TextStyle(
                color: foregroundColor.withValues(alpha: 0.4),
              ),
            ),
          ),
      ],
    );
  }

  Widget categoriesWidget(BuildContext context) {
    return SizedBox(
      height: AppSize.categoriesBarHeight,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return categoryWidget(context, categories[index]);
        },
        separatorBuilder: (_, __) {
          return SizedBox(width: AppSize.itemSpacing);
        },
      ),
    );
  }

  Widget categoryWidget(BuildContext context, ShopCategory category) {
    return GestureDetector(
      onTap: () {
        if (onCategory != null) {
          onCategory!(category);
        }
      },
      child: Column(
        children: [
          categoryAvatar(category.imageUrl, AppSize.categoriesImageHeightSmall),
          categoryName(context, category.name),
        ],
      ),
    );
  }

  Widget categoryAvatar(String imageUrl, double size) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: foregroundColor,
        shape: BoxShape.circle,
      ),
      child: ImageWidget(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget categoryName(BuildContext context, String name) {
    return Text(
      name,
      style:
          Theme.of(context).textTheme.labelSmall?.apply(color: foregroundColor),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
