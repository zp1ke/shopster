import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/shop/widgets/shop_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBoxWidget(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ShopHeaderWidget(
            child: Center(
              child: Text('HEADER TODO'),
            ),
          ),
          Center(
            child: Text('HOME TODO'),
          ),
        ],
      ),
    );
  }
}
