import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AssetAnimation extends StatelessWidget {
  final String name;
  final double? height;
  final BoxFit? fit;

  const AssetAnimation(
    this.name, {
    super.key,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      name,
      height: height,
      fit: fit,
    );
  }
}
