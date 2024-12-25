import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/image_circular.dart';
import 'package:shopster/common/widgets/section_heading.dart';
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
          SectionHeadingWidget(
            title: title,
            foregroundColor: foregroundColor,
            actionTitle: actionTitle,
            onAction: onAction,
          ),
          categoriesWidget(context),
        ],
      ),
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
          ImageCircular(
            size: AppSize.categoriesImageHeightSmall,
            color: foregroundColor,
            imageUrl: category.imageUrl,
          ),
          categoryName(context, category.name),
        ],
      ),
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
