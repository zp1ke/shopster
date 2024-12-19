import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class PageBoxWidget extends StatelessWidget {
  final Widget child;

  const PageBoxWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: AppSize.pageMinWidth,
          maxWidth: AppSize.pageMaxWidth,
        ),
        child: child,
      ),
    );
  }
}
