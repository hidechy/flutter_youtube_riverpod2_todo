import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/utils/constants.dart';
import '../../common/widgets/appstyle.dart';
import '../../common/widgets/reusable_text.dart';
import '../../common/widgets/width_spacer.dart';
import 'page_one.dart';
import 'page_two.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();

  ///
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => pageController.jumpToPage(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () => pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                ),
                            child: const Icon(Ionicons.chevron_forward_circle, size: 30)),
                        const WidthSpacer(size: 5),
                        ReusableText(text: 'Skip', style: appstyle(16, AppConst.kLight, FontWeight.w500)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    ),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: WormEffect(
                        dotHeight: 12,
                        spacing: 10,
                        dotColor: AppConst.kYellow.withOpacity(0.5),
                        activeDotColor: AppConst.kLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
