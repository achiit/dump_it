
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/view_models/splash_VM.dart';
import 'package:dump_it/ui/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}



class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Trigger the animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300))
          .then((value) =>
              Provider.of<SplashViewModel>(context, listen: false)
                  .startAnimation())
          .then(
              (value) => Future.delayed(const Duration(milliseconds: 800)).then(
                    (value) => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeView(),
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    ),
                  ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Stack(
        children: [
          Consumer<SplashViewModel>(
            builder: (context, viewModel, child) {
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    bottom: viewModel.isClicked
                        ? -(screenHeight * 0.52)
                        : -(screenHeight * 0.06),
                    left: viewModel.isClicked
                        ? -(screenHeight * 0.5)
                        : -screenWidth * 0.3,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: screenWidth * 0.5,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    bottom: viewModel.isClicked
                        ? -(screenWidth * 1.5)
                        : -(screenWidth * 0.45),
                    right: viewModel.isClicked
                        ? -(screenWidth * 1.5)
                        : -screenWidth * 0.35,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: screenHeight * 0.25,
                    ),
                  ),
                  // AnimatedPositioned(
                  //   duration: Duration(milliseconds: 400),
                  //   top: viewModel.isClicked
                  //       ? screenHeight / 2 - (screenWidth * 0.3) / 2
                  //       : screenHeight / 3,
                  //   left: (screenWidth / 3.25),
                  //   child: AnimatedOpacity(
                  //     duration: Duration(milliseconds: 100),
                  //     opacity: 1.0,
                  //     child: Column(
                  //       children: [
                  //         SvgPicture.asset(
                  //           'assets/images/logo.svg',
                  //           width: screenWidth * 0.4,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
