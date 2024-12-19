import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get I => Get.find();

  final pageController = PageController();
  final _currentPage = 0.obs;

  int get pageIndex {
    return _currentPage.value;
  }

  void updatePageIndicator(int index) {
    _currentPage.value = index;
  }

  void movePageIndicator(int index) {
    _currentPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
