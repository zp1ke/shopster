import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(AppSize.defaultSpacing),
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          Image(
            image: AssetImage(image),
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.6,
          ),
          Text(
            title,
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
