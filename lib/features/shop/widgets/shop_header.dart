import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/circular_container.dart';
import 'package:shopster/common/widgets/curved_header.dart';

class ShopHeaderWidget extends StatelessWidget {
  final double size;
  final Widget? child;

  const ShopHeaderWidget({
    super.key,
    this.size = AppSize.shopHeaderSize,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedHeader(
      backgroundColor: Theme.of(context).colorScheme.app.shopHeaderBackground,
      height: size,
      child: Stack(
        children: [
          Positioned(
            top: size * -0.4,
            right: size * -0.65,
            child: CircularContainer(
              width: size,
              height: size,
              radius: size,
            ),
          ),
          Positioned(
            top: size * 0.25,
            right: size * -0.75,
            child: CircularContainer(
              width: size,
              height: size,
              radius: size,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
