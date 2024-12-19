import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/features/authentication/controllers/on_boarding.dart';
import 'package:shopster/features/authentication/screens/on_boarding/page.dart';
import 'package:shopster/features/authentication/screens/sign_in.dart';
import 'package:shopster/l10n/app_l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final pages = buildPages(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: pages,
          ),
          Obx(() => skipButton(context, pages.length)),
          navigation(pages.length),
          nextButton(pages.length),
        ],
      ),
    );
  }

  List<OnBoardingPage> buildPages(BuildContext context) {
    final app1l0n = AppL10n.of(context);
    return <OnBoardingPage>[
      OnBoardingPage(
        image: AppImage.onboardingSearching,
        title: app1l0n.onboardingSearchingTitle,
        subtitle: app1l0n.onboardingSearchingSubtitle,
      ),
      OnBoardingPage(
        image: AppImage.onboardingShopping,
        title: app1l0n.onboardingShoppingTitle,
        subtitle: app1l0n.onboardingShoppingSubtitle,
      ),
      OnBoardingPage(
        image: AppImage.onboardingDelivery,
        title: app1l0n.onboardingDeliveryTitle,
        subtitle: app1l0n.onboardingDeliverySubtitle,
      ),
    ];
  }

  Widget skipButton(BuildContext context, int pagesCount) {
    if (OnboardingController.I.pageIndex >= pagesCount - 1) {
      return Container();
    }
    return Positioned(
      top: AppSize.defaultSpacing,
      right: AppSize.defaultSpacing,
      child: TextButton(
        onPressed: goSignIn,
        child: Text(AppL10n.of(context).skip),
      ),
    );
  }

  Widget navigation(int pagesCount) {
    return Positioned(
      bottom: AppSize.sectionSpacing,
      left: AppSize.defaultSpacing,
      child: SmoothPageIndicator(
        controller: OnboardingController.I.pageController,
        count: pagesCount,
        onDotClicked: OnboardingController.I.movePageIndicator,
        effect: ExpandingDotsEffect(),
      ),
    );
  }

  Widget nextButton(int pagesCount) {
    return Positioned(
      bottom: AppSize.defaultSpacing,
      right: AppSize.defaultSpacing,
      child: ElevatedButton(
        onPressed: () {
          if (OnboardingController.I.pageIndex >= pagesCount - 1) {
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
