import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as riv;

class LoginViewModel extends ChangeNotifier {
  bool isShowLoading = false;
  bool isFormValid = false;
  bool isShowConfetti = false;
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late riv.SMITrigger check;
  late riv.SMITrigger error;
  late riv.SMITrigger reset;
  late riv.SMITrigger confetti;

  void validateForm() {
    isFormValid = formKey.currentState?.validate() ?? false;
    notifyListeners();
  }

  void signin(AnimationController controller, BuildContext context) {
    isShowLoading = true;
    isShowConfetti = true;
    notifyListeners();

    Future.delayed(
      Duration(seconds: 1),
      () {
        if (isFormValid) {
          check.fire();
          confetti.fire();
          controller.forward();
          Future.delayed(
            Duration(seconds: 2),
            () {
              isShowLoading = false;
              notifyListeners();

              controller.reset();

              Future.delayed(
                Duration(seconds: 1),
                () => Navigator.pushReplacementNamed(
                  context,
                  '/filldetails'
                  // '/home',
                ),
              );
            },
          );
        } else {
          error.fire();
          controller.forward();
          Future.delayed(Duration(seconds: 2), () {
            isShowLoading = false;
            notifyListeners();
            controller.reset();
          });
        }
      },
    );
  }
}
