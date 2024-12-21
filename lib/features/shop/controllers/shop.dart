import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  final _currentPage = 0.obs;

  final _pages = [
    Container(color: Colors.deepPurple),
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
