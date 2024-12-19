import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/features/authentication/controllers/on_boarding.dart';
import 'package:shopster/features/authentication/screens/on_boarding/page.dart';
import 'package:shopster/features/authentication/screens/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final pages = [
    OnBoardingPage(
      image: AppImage.onboardingSearching,
      title: 'TODO onboardingSearching title',
      subtitle: 'TODO onboardingSearching subtitle',
    ),
    OnBoardingPage(
      image: AppImage.onboardingShopping,
      title: 'TODO onboardingShopping title',
      subtitle: 'TODO onboardingShopping subtitle',
    ),
    OnBoardingPage(
      image: AppImage.onboardingDelivery,
      title: 'TODO onboardingDelivery title',
      subtitle: 'TODO onboardingDelivery subtitle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: pages,
          ),
          Obx(skipButton),
          navigation(),
          nextButton(),
        ],
      ),
    );
  }

  Widget skipButton() {
    if (OnboardingController.I.pageIndex >= pages.length - 1) {
      return Container();
    }
    return Positioned(
      top: AppSize.defaultSpacing,
      right: AppSize.defaultSpacing,
      child: TextButton(
        onPressed: goSignIn,
        child: const Text('Skip TODO'),
      ),
    );
  }

  Widget navigation() {
    return Positioned(
      bottom: AppSize.sectionSpacing,
      left: AppSize.defaultSpacing,
      child: SmoothPageIndicator(
        controller: OnboardingController.I.pageController,
        count: pages.length,
        onDotClicked: OnboardingController.I.movePageIndicator,
        effect: ExpandingDotsEffect(),
      ),
    );
  }

  Widget nextButton() {
    return Positioned(
      bottom: AppSize.defaultSpacing,
      right: AppSize.defaultSpacing,
      child: ElevatedButton(
        onPressed: () {
          if (OnboardingController.I.pageIndex >= pages.length - 1) {
            goSignIn();
          } else {
            OnboardingController.I
                .movePageIndicator(OnboardingController.I.pageIndex + 1);
          }
        },
        style: ElevatedButton.styleFrom(elevation: AppSize.buttonElevation),
        child: FaIcon(FontAwesomeIcons.arrowRight),
      ),
    );
  }

  void goSignIn() {
    Get.offNamed(SignInScreen.path);
  }
}