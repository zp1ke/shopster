import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/screens/home/home.dart';
import 'package:shopster/features/shop/screens/store/store.dart';
import 'package:shopster/features/shop/screens/user/user.dart';
import 'package:shopster/features/shop/screens/wish/wish.dart';

class ShopController extends GetxController {
  final _currentPage = 0.obs;
  final _pages = <ShopPage>[
    HomePage(),
    StorePage(),
    WishPage(),
    UserPage(),
  ];

  int get pageIndex {
    return _currentPage.value;
  }

  set pageIndex(int index) {
    _currentPage.value = index;
  }

  List<NavigationDestination> menu(BuildContext context) {
    return _pages
        .map((page) => page.navigationMenu(context))
        .toList(growable: false);
  }

  Widget get page {
    return _pages[_currentPage.value].widget();
  }
}
