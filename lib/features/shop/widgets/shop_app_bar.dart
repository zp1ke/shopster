import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/image/icons.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final bool canGoBack;
  final VoidCallback? onLeading;
  final IconData? leadingIcon;
  final List<Widget>? actions;

  const ShopAppBar({
    super.key,
    this.titleText,
    this.title,
    this.canGoBack = false,
    this.onLeading,
    this.leadingIcon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.itemSpacing),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: leadingWidget(context),
        title: titleWidget(context),
        actions: actions,
      ),
    );
  }

  Widget? leadingWidget(BuildContext context) {
    if (canGoBack) {
      return IconButton(
        onPressed: Get.back,
        icon: Icon(
          AppIcons.arrowBackFilled,
          color: Theme.of(context).colorScheme.app.shopHeaderForeground,
        ),
      );
    }
    if (leadingIcon != null) {
      return IconButton(
        onPressed: onLeading,
        icon: Icon(leadingIcon),
      );
    }
    return null;
  }

  Widget? titleWidget(BuildContext context) {
    if (titleText != null) {
      return Text(
        titleText!,
        style: TextStyle(
          color: Theme.of(context).colorScheme.app.shopHeaderForeground,
        ),
      );
    }
    return title;
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(AppSize.appBarHeight);
  }
}
