import 'package:dump_it/data/models/comment_model.dart';
import 'package:dump_it/ui/view_models/comments_VM.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:provider/provider.dart';

Widget buildCommentSection(CommentsVM viewModel) {
  return ListView.builder(
    shrinkWrap:
        true, // This will prevent the ListView from taking up the full available height
    physics: const NeverScrollableScrollPhysics(),
    itemCount: viewModel.comments.length,
    itemBuilder: (BuildContext context, int index) {
      final comment = viewModel.comments[index];
      final isLastComment = index == viewModel.comments.length - 1;

      return Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Card(
              margin: EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comment.user,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          '${comment.time.hour}:${comment.time.minute}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      comment.content,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                if (comment.isLiked)
                                  BoxShadow(
                                    color: Color(0xff21c063).withOpacity(0.4),
                                    blurRadius: 10.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(0.0, 2.0),
                                  ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.toggleLike(index);
                              },
                              child: Icon(
                                Icons.thumb_up,
                                color: comment.isLiked
                                    ? Colors.white
                                    : Colors.black,
                                size: 5.w,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: comment.isLiked
                                    ? Color(0xff21c063)
                                    : Colors.white,
                                elevation: 0,
                                side: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                if (comment.isDisliked)
                                  BoxShadow(
                                    color: Color(0xffff5c5c).withOpacity(0.4),
                                    blurRadius: 10.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(0.0, 2.0),
                                  ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.toggleDislike(index);
                              },
                              child: Icon(
                                Icons.thumb_down,
                                color: comment.isDisliked
                                    ? Colors.white
                                    : Colors.black,
                                size: 5.w,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: comment.isDisliked
                                    ? Color(0xffff5c5c)
                                    : Colors.white,
                                elevation: 0,
                                side: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: isLastComment ? null : 0.0,
            left: 35.0,
            child: Container(
              height: isLastComment ? 0.0 : double.infinity,
              width: 2.0,
              color: Colors.grey.shade400,
            ),
          ),
          Positioned(
            top: 0.0, // Adjust as needed
            left: 7,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 6.8.w,
              child: Container(
                height: 5.h,
                width: 5.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/login image.jpeg"),
                  radius: 20,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
