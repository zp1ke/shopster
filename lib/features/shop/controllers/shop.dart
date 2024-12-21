import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/features/shop/screens/home/home.dart';

class ShopController extends GetxController {
  final _currentPage = 0.obs;

  final _pages = [
    HomeScreen(),
    Container(color: Colors.deepOrange),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];

  int get pageIndex {
    return _currentPage.value;
  }

  set pageIndex(int index) {
    _currentPage.value = index;
  }

  Widget get page {
    return _pages[_currentPage.value];
  }
}
