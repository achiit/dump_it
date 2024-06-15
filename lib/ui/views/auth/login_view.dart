import 'package:auto_size_text/auto_size_text.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/shared/widgets/custom_positioned.dart';
import 'package:dump_it/ui/shared/widgets/fadein_animation.dart';
import 'package:dump_it/ui/shared/widgets/progress_button.dart';
import 'package:dump_it/ui/view_models/login_VM.dart';
import 'package:dump_it/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart' as riv;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: LoginViewContent(),
    );
  }
}

class LoginViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/login image.jpeg",
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        height: 46.3.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xffff4500), Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInSlide(
                          duration: 0.9,
                          curve: Curves.easeInOut,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Hey! Let\'s Get Real About College at ',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontFamily: "Nexa Bold",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "Dump IT !",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.sp,
                                      fontFamily: "Nexa Bold",
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            minFontSize: 5,
                          ),
                        ),
                        FadeInSlide(
                          duration: 0.9,
                          child: Text(
                            "Get yourself a User Name!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        FadeInSlide(
                          duration: 0.9,
                          child: Text(
                            "Pro Tip: A unique username can make you 3x more memorable! 🔥💡",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        FadeInSlide(
                          duration: 0.9,
                          child: TextFormField(
                            controller: viewModel.usernameController,
                            style: TextStyle(fontSize: 17.sp),
                            decoration: InputDecoration(
                              hintText: 'User Name',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 17.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a User Name';
                              }
                              return null;
                            },
                            onChanged: (_) => viewModel.validateForm(),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        FadeInSlide(
                          duration: 0.9,
                          child: Text(
                            "Sign in to Start Dumping!",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        FadeInSlide(
                          duration: 0.9,
                          child: ProgressButton(
                            color: viewModel.isFormValid
                                ? Colors.grey.shade100
                                : Colors.grey.shade300,
                            progressIndicatorColor: AppColors.primary,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            strokeWidth: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/googlelogo.png",
                                  height: 30,
                                  width: 30,
                                ),
                                Text(
                                  "Sign Up with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: (AnimationController controller) {
                              viewModel.signin(controller, context);
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Adaptive.w(90),
                              child: Text(
                                'By continuing, you acknowledge that you have read and understood, and agree to Dump IT\'s Terms of Service and Privacy Policy.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff948A8A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (viewModel.isShowLoading)
            CustomPositioned(
              child: riv.RiveAnimation.asset(
                "assets/rive_assets/check.riv",
                onInit: (artboard) {
                  riv.StateMachineController controller =
                      RiveUtils.getRiveController(artboard);
                  viewModel.check =
                      controller.findSMI("Check") as riv.SMITrigger;
                  viewModel.error =
                      controller.findSMI("Error") as riv.SMITrigger;
                  viewModel.reset =
                      controller.findSMI("Reset") as riv.SMITrigger;
                },
              ),
            ),
          if (viewModel.isShowConfetti)
            CustomPositioned(
              child: Transform.scale(
                scale: 30,
                child: riv.RiveAnimation.asset(
                  "assets/rive_assets/confetti.riv",
                  onInit: (artboard) {
                    riv.StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    viewModel.confetti = controller.findSMI("Trigger explosion")
                        as riv.SMITrigger;
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
