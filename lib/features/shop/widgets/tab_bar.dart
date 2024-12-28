import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';

class ShopTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const ShopTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: TabBar(
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.appBarHeight);
}
