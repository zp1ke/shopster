import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';

class ShopCartButton extends StatelessWidget {
  final Color? iconColor;

  const ShopCartButton({
    super.key,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Badge(
        label: Text('T'),
        offset: Offset(AppSize.badgeOffset, -AppSize.badgeOffset),
        child: Icon(
          AppIcons.shoppingCartOutlined,
          color: iconColor ??
              Theme.of(context).colorScheme.app.shopHeaderForeground,
        ),
      ),
    );
  }
}
