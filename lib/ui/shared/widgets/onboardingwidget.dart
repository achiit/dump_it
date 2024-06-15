import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:dump_it/data/models/onboarding_model.dart';
import 'package:dump_it/ui/views/auth/login_view.dart';
import 'package:dump_it/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingData data;
  final PageController pageController;
  final int currentIndex;
  final int totalPageCount;

  OnboardingContent({
    required this.data,
    required this.pageController,
    required this.currentIndex,
    required this.totalPageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF3E007B),
                const Color(0xFF8960FF),
              ],
            ),
          ),
        ),
        Positioned(
          top: data.image1top,
          right: data.image1left,
          child: SvgPicture.asset(data.imagePath1),
        ),
        Positioned(
          bottom: 30.h,
          right: 0,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              height: 11.h,
              width: 60.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFD23A3A),
                    Color(0xFFF49763),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
            ),
          ),
        ),
        Newton(
          // Add any kind of effects to your UI
          // For example:
          activeEffects: [
            RainEffect(
              particleConfiguration: ParticleConfiguration(
                shape: CircleShape(),
                size: const Size(5, 5),
                color: const SingleParticleColor(color: Colors.white),
              ),
              effectConfiguration: const EffectConfiguration(),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 34.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 7.5.h,
                bottom: 5.h,
                left: 3.4.w,
                right: 3.4.w,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topRight,
                  begin: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFD23A3A),
                    Color(0xFFF49763),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.5.h),
                  topRight: Radius.circular(2.5.h),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Nexa Bold",
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  OpenContainer(
                    closedBuilder: (context, openContainer) {
                      return ElevatedButton(
                        onPressed: () {
                          if (currentIndex < totalPageCount - 1) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            openContainer();
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: Size(50, 60),
                          // primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 5.w,
                          ),
                        ),
                      );
                    },
                    openBuilder: (context, closeContainer) {
                      return LoginView();
                    },
                    closedElevation: 6.0,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    closedColor: Colors.white,
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: data.imageTop,
          left: data.imageLeft,
          child: Image.asset(
            data.imagePath,
          ),
        ),
        Positioned(
          bottom: data.animatedTextPositionTop,
          right: data.animatedTextPositionRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: TextStyle(
                  fontFamily: "Nexa Bold",
                  fontWeight: FontWeight.bold,
                  fontSize: 21.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 50.w,
                height: 5.h,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: "Horizon",
                    fontWeight: FontWeight.bold,
                    fontSize: 19.sp,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: data.animatedTexts
                        .map((text) => RotateAnimatedText(text))
                        .toList(),
                    repeatForever: true,
                    isRepeatingAnimation: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
