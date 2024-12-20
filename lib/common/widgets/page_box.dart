import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class PageBoxWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool scrollable;

  const PageBoxWidget({
    super.key,
    required this.child,
    this.padding,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: AppSize.pageMinWidth,
          maxWidth: AppSize.pageMaxWidth,
        ),
        child: child,
      ),
    );
    final edgeInsets = padding ?? EdgeInsets.all(AppSize.defaultSpacing);
    if (scrollable) {
      return SingleChildScrollView(padding: edgeInsets, child: body);
    }
    return Padding(padding: edgeInsets, child: body);
  }
}
