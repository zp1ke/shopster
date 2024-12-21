import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/icons.dart';
import 'package:shopster/common/widgets/image_text.dart';
import 'package:shopster/common/widgets/page_box.dart';
import 'package:shopster/features/authentication/controllers/on_boarding.dart';
import 'package:shopster/features/authentication/screens/sign_in/sign_in.dart';
import 'package:shopster/l10n/app_l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  static const path = '/on-boarding';

  static GetPage route() {
    return GetPage(name: path, page: () => OnBoardingScreen());
  }

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final pages = buildPages(context);
    return Scaffold(
      body: PageBoxWidget(
        scrollable: false,
        padding: EdgeInsets.zero,
        child: Stack(
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
      ),
    );
  }

  List<ImageTextWidget> buildPages(BuildContext context) {
    final app1l0n = AppL10n.of(context);
    final padding = EdgeInsets.symmetric(
      vertical: AppSize.sectionSpacing * 2,
      horizontal: AppSize.defaultSpacing,
    );
    return <ImageTextWidget>[
      ImageTextWidget(
        image: AppImage.onboardingSearching,
        title: app1l0n.onboardingSearchingTitle,
        subtitle: app1l0n.onboardingSearchingSubtitle,
        padding: padding,
      ),
      ImageTextWidget(
        image: AppImage.onboardingShopping,
        title: app1l0n.onboardingShoppingTitle,
        subtitle: app1l0n.onboardingShoppingSubtitle,
        padding: padding,
      ),
      ImageTextWidget(
        image: AppImage.onboardingDelivery,
        title: app1l0n.onboardingDeliveryTitle,
        subtitle: app1l0n.onboardingDeliverySubtitle,
        padding: padding,
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
        child: Text(AppL10n.of(context).onboardingSkip),
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
        child: const Icon(AppIcons.arrowForwardFilled),
      ),
    );
  }

  void goSignIn() {
    Get.offAllNamed(SignInScreen.path);
  }
}
