import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/utils/logger.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageWidget(
    this.image, {
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  bool get isUrl {
    try {
      return Uri.parse(image).isAbsolute;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isUrl) {
      return networkImage();
    }
    return assetImage();
  }

  Widget networkImage() {
    if (image.endsWith('.svg')) {
      return SvgPicture.network(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (_) => placeholder(),
      );
    }
    if (image.endsWith('.json')) {
      return Lottie.network(image, width: width, height: height, fit: fit);
    }
    return Image.network(
      image,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (_, child, progress) {
        if (progress == null) {
          return child;
        }
        return placeholder();
      },
      errorBuilder: (context, e, _) {
        AppLogger.error(e.toString(), e);
        return errorPlaceholder(context);
      },
    );
  }

  Widget assetImage() {
    if (image.endsWith('.svg')) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (_) => placeholder(),
      );
    }
    if (image.endsWith('.json')) {
      return Lottie.asset(image, width: width, height: height, fit: fit);
    }
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, e, _) {
        AppLogger.error(e.toString(), e);
        return errorPlaceholder(context);
      },
    );
  }

  Widget placeholder() {
    return Center(
      child: const CircularProgressIndicator.adaptive(),
    );
  }

  Widget errorPlaceholder(BuildContext context) {
    return Center(
      child: Icon(
        AppIcons.errorFilled,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
