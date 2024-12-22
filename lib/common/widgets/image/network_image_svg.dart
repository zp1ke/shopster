import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageSvg extends StatelessWidget {
  final String url;
  final double padding;
  final double? height;
  final BoxFit? fit;

  const NetworkImageSvg(
    this.url, {
    super.key,
    this.padding = 2,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      height: height,
      fit: fit ?? BoxFit.scaleDown,
      placeholderBuilder: (_) {
        return Padding(
          padding: EdgeInsets.all(padding),
          child: const CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
