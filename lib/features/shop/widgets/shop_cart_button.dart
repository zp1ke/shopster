import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/icons.dart';

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
          color: iconColor ?? AppTheme.shopHeaderForegroundColor(context),
        ),
      ),
    );
  }
}
