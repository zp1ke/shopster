import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class CurvedHeader extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final Widget child;

  const CurvedHeader({
    super.key,
    this.height = AppSize.shopHeaderSize,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CurvedEdges(),
      child: Container(
        color: backgroundColor,
        child: SizedBox(
          height: height,
          child: child,
        ),
      ),
    );
  }
}

class _CurvedEdges extends CustomClipper<Path> {
  final double radius = AppSize.buttonRadius * 2;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final dxWith = radius + (radius / 2);

    final startCurveFirst = Offset(0, size.height - radius);
    final startCurveLast = Offset(dxWith, size.height - radius);
    path.quadraticBezierTo(startCurveFirst.dx, startCurveFirst.dy,
        startCurveLast.dx, startCurveLast.dy);

    final midCurveFirst = Offset(0, size.height - radius);
    final midCurveLast = Offset(size.width - dxWith, size.height - radius);
    path.quadraticBezierTo(
        midCurveFirst.dx, midCurveFirst.dy, midCurveLast.dx, midCurveLast.dy);

    final endCurveFirst = Offset(size.width, size.height - radius);
    final endCurveLast = Offset(size.width, size.height);
    path.quadraticBezierTo(
        endCurveFirst.dx, endCurveFirst.dy, endCurveLast.dx, endCurveLast.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
