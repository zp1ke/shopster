import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/controllers/shop.dart';
import 'package:shopster/features/shop/screens/store/store.dart';
import 'package:shopster/utils/debounce.dart';

class ShopSearchBar extends StatelessWidget {
  final String? hintText;
  final Debounce _debounce;

  ShopSearchBar({
    super.key,
    this.hintText,
  }) : _debounce = Debounce(duration: Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.defaultSpacing),
      child: SearchAnchor(
        builder: (context, controller) {
          return SearchBar(
            controller: controller,
            leading: const Icon(AppIcons.searchFilled),
            hintText: hintText,
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.buttonRadius),
                ),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: AppSize.itemSpacing),
            ),
            onChanged: (_) {
              _debounce.run(controller.openView);
            },
          );
        },
        suggestionsBuilder: (context, controller) {
          return List<ListTile>.generate(
            5,
            (int index) {
              final String item = 'TODO $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  ShopController.I.navToPage(StorePage.pageId);
                },
              );
            },
          );
        },
      ),
    );
  }
}
