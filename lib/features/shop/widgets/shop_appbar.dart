import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/icons.dart';

class ShopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final bool canGoBack;
  final VoidCallback? onLeading;
  final IconData? leadingIcon;
  final List<Widget>? actions;

  const ShopAppbar({
    super.key,
    this.titleText,
    this.title,
    this.canGoBack = false,
    this.onLeading,
    this.leadingIcon,
    this.actions,
  });

  Color foregroundColor(BuildContext context) {
    return AppTheme.shopHeaderForegroundColor(context);
  }

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
          color: foregroundColor(context),
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
        style: TextStyle(color: foregroundColor(context)),
      );
    }
    return title;
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(AppSize.appbarHeight);
  }
}
