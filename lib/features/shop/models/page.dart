import 'package:flutter/material.dart';

abstract class ShopPage {
  NavigationDestination? _navigationMenu;
  Widget? _widget;

  NavigationDestination navigationMenu(BuildContext context) {
    _navigationMenu ??= buildNavigationMenu(context);
    return _navigationMenu!;
  }

  Widget widget() {
    _widget ??= buildWidget();
    return _widget!;
  }

  NavigationDestination buildNavigationMenu(BuildContext context);

  Widget buildWidget();
}
