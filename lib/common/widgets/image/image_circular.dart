import 'package:flutter/material.dart';
import 'package:shopster/common/widgets/image/image.dart';

class ImageCircular extends StatelessWidget {
  final double size;
  final Color color;
  final String imageUrl;
  final BoxFit fit;

  const ImageCircular({
    super.key,
    required this.size,
    required this.color,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: ImageWidget(imageUrl, fit: fit),
    );
  }
}
