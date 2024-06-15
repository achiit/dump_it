import 'package:dump_it/ui/view_models/splash_VM.dart';
import 'package:dump_it/ui/views/onboardingscreens/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the logo animation controller and animation
    _logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _logoAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticOut,
      ),
    );

    // Initialize the text animation controller and animation
    _textController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.elasticOut,
    );

    // Trigger the animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logoController.forward();
      Future.delayed(const Duration(milliseconds: 300))
          .then((value) => Provider.of<SplashViewModel>(context, listen: false)
              .startAnimation())
          .then(
              (value) => Future.delayed(const Duration(milliseconds: 800)).then(
                    (value) => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => OnboardingPage(),
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    ),
                  ));
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      body: Stack(
        children: [
          Consumer<SplashViewModel>(
            builder: (context, viewModel, child) {
              return Center(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _logoAnimation,
                        child: Image.asset(
                          'assets/images/dumpitlogo.png',
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.9,
                        ),
                      ),
                      ScaleTransition(
                        scale: _textAnimation,
                        child: Text(
                          "DUMP IT",
                          style: TextStyle(
                            fontFamily: "Paris",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
