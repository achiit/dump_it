import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String content;
  final String imagePath;
  final String imagePath1;
  final double imageTop;
  final double imageLeft;
  final double image1top;
  final double image1left;
  final double animatedTextPositionTop;
  final double animatedTextPositionRight;
  final List<String> animatedTexts;

  OnboardingData({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.imagePath1,
    required this.imageTop,
    required this.imageLeft,
    required this.image1top,
    required this.image1left,
    required this.animatedTextPositionTop,
    required this.animatedTextPositionRight,
    required this.animatedTexts,
  });
}
