import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isClicked = false;

  bool get isClicked => _isClicked;

  void startAnimation() {
    _isClicked = true;
    notifyListeners();
  }
}
