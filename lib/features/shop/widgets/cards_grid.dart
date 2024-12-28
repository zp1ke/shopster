import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';

typedef CardsGridWidgetBuilder = Widget Function(
  BuildContext context,
  int index,
  double cardWidth,
);

class CardsGrid extends StatelessWidget {
  final double desiredCardWidth;
  final double cardMinWidth;
  final double itemSpacing;
  final int itemsCount;
  final CardsGridWidgetBuilder itemBuilder;

  const CardsGrid({
    super.key,
    this.desiredCardWidth = AppSize.productCardWidth,
    this.cardMinWidth = AppSize.productCardMinWidth,
    this.itemSpacing = AppSize.itemSpacing,
    required this.itemsCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var cardWidth = desiredCardWidth;
    final screenWidth = MediaQuery.of(context).size.width - itemSpacing * 2;
    if (screenWidth / cardWidth < 2) {
      cardWidth = max(screenWidth / 2, cardMinWidth);
    }
    final items = List<Widget>.generate(
        itemsCount, (index) => itemBuilder(context, index, cardWidth));
    return Wrap(
      spacing: itemSpacing,
      runSpacing: itemSpacing,
      children: items,
    );
  }
}
