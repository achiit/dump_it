import 'package:flutter/material.dart';
import 'package:dump_it/data/models/comment_model.dart';

class CommentsVM extends ChangeNotifier {
  List<Comment> _comments=commentslist;

  List<Comment> get comments => _comments;

  void toggleLike(int index) {
    _comments[index].isLiked = !_comments[index].isLiked;
    if (_comments[index].isLiked) {
      _comments[index].isDisliked = false; // Unset dislike if like is set
    }
    notifyListeners();
  }

  void toggleDislike(int index) {
    _comments[index].isDisliked = !_comments[index].isDisliked;
    if (_comments[index].isDisliked) {
      _comments[index].isLiked = false; // Unset like if dislike is set
    }
    notifyListeners();
  }
}
