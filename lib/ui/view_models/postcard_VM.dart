import 'package:flutter/material.dart';



class PostCardViewModel extends ChangeNotifier {
  bool _isExpanded = false;
  bool _showComments = false;
  bool _isLike = false;
  bool _isDislike = false;

  bool get isExpanded => _isExpanded;
  bool get showComments => _showComments;
  bool get isLike => _isLike;
  bool get isDislike => _isDislike;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void toggleShowComments() {
    _showComments = !_showComments;
    notifyListeners();
  }

  void toggleLike() {
    _isLike = !_isLike;
    if (_isLike) _isDislike = false;
    notifyListeners();
  }

  void toggleDislike() {
    _isDislike = !_isDislike;
    if (_isDislike) _isLike = false;
    notifyListeners();
  }


}
