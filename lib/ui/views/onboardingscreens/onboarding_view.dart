import 'package:animations/animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dump_it/data/models/onboarding_model.dart';
import 'package:dump_it/ui/shared/widgets/onboardingwidget.dart';
import 'package:dump_it/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final List<OnboardingData> data = [
    OnboardingData(
      title: "Discover the",
      content:
          "Uncover authentic college experiences shared by Students, Alumni and more. Make informed decisions.",
      imagePath: "assets/images/onboarding1 (1).png",
      imagePath1: "assets/images/onboarding1circle.svg",
      imageTop: 14.h,
      imageLeft: 0.5.w,
      image1top: 2.h,
      image1left: -0.5.w,
      animatedTextPositionTop: 45.h,
      animatedTextPositionRight: 1.h,
      animatedTexts: ['Truth', 'Reality', 'Facts'],
    ),
    OnboardingData(
      title: "Share ",
      content:
          "Post your honest opinions and stories anonymously. Help others with your insights.",
      imagePath: "assets/images/onboarding2 (1).png",
      imagePath1: "assets/images/onboardingtablet2.svg",
      imageTop: 15.h,
      imageLeft: 47.w,
      image1top: 10.h,
      image1left: 70.w,
      animatedTextPositionTop: 44.h,
      animatedTextPositionRight: 20.h,
      animatedTexts: ['Anonymously', 'Stories', 'Experiences'],
    ),
    OnboardingData(
      title: "Empower Your ",
      content:
          "Explore a diverse range of candid reviews and testimonials. Choose the college that’s right for you.",
      imagePath: "assets/images/onboarding3 (1).png",
      imagePath1: "assets/images/onboarding3ring.svg",
      image1top: 7.h,
      image1left: -10.w,
      imageTop: 17.h,
      imageLeft: 0.8.w,
      animatedTextPositionTop: 80.h,
      animatedTextPositionRight: 20.h,
      animatedTexts: ['Choice', 'Decision', 'Selection'],
    ),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OnboardingContent(
            data: data[index],
            pageController: _pageController,
            currentIndex: index,
            totalPageCount: data.length,
          );
        },
      ),
    );
  }
}
