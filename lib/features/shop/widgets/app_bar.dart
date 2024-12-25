import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final Color? backgroundColor;
  final bool canGoBack;
  final VoidCallback? onLeading;
  final IconData? leadingIcon;
  final List<Widget>? actions;

  const ShopAppBar({
    super.key,
    this.titleText,
    this.title,
    this.backgroundColor,
    this.canGoBack = false,
    this.onLeading,
    this.leadingIcon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leadingWidget(context),
      title: titleWidget(context),
      actions: actions,
    );
  }

  Widget? leadingWidget(BuildContext context) {
    if (canGoBack) {
      return IconButton(
        onPressed: Get.back,
        icon: Icon(
          AppIcons.arrowBackFilled,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
    }
    if (leadingIcon != null) {
      return IconButton(
        onPressed: onLeading,
        icon: Icon(
          leadingIcon,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
    }
    return null;
  }

  Widget? titleWidget(BuildContext context) {
    if (titleText != null) {
      final theme = Theme.of(context);
      return Text(
        titleText!,
        style: theme.textTheme.headlineSmall?.apply(
          color: theme.colorScheme.onPrimaryContainer,
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
