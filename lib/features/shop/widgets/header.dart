import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/curved_header.dart';
import 'package:shopster/common/widgets/rounded_container.dart';
import 'package:shopster/utils/device.dart';

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
    final theme = Theme.of(context);
    return CurvedHeader(
      backgroundColor: theme.colorScheme.primaryContainer,
      height: size,
      child: Stack(
        children: [
          Positioned(
            top: size * -0.4,
            left: size * -0.65,
            child: RoundedContainer(
              width: size,
              height: size,
              radius: size,
              backgroundColor: theme.canvasColor.withValues(alpha: 0.1),
            ),
          ),
          Positioned(
            top: size * 0.25,
            right: size * -0.75,
            child: RoundedContainer(
              width: size,
              height: size,
              radius: size,
              backgroundColor: theme.canvasColor.withValues(alpha: 0.1),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }

  double statusBarHeight(BuildContext context) {
    if (DeviceUtils.isAndroid) {
      return MediaQuery.of(context).viewPadding.top;
    }
    return .0;
  }
}
