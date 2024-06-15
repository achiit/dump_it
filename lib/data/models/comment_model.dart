class Comment {
  final String user;
  final String content;
  final DateTime time;
  bool isLiked;
  bool isDisliked;

  Comment(this.user, this.content, this.time,
      {this.isLiked = false, this.isDisliked = false});
}

List<Comment> get commentslist => [
      Comment("User1", "Congrats on your job!",
          DateTime.now().subtract(Duration(minutes: 5))),
      Comment("User2", "That's awesome!",
          DateTime.now().subtract(Duration(minutes: 10))),
      Comment("User3", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
      Comment("User4", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
      Comment("User5", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
      Comment("User6", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
      Comment("User7", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
      Comment("User8", "Well done!",
          DateTime.now().subtract(Duration(minutes: 20))),
    ];
