import 'package:blur/blur.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/view_models/postcard_VM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  OverlayEntry? overlayEntry;

  void _removeFullImage() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    void _showFullImage(BuildContext context, String imagePath) {
      overlayEntry = OverlayEntry(
        builder: (context) => GestureDetector(
          onTap: () {
            _removeFullImage();
          },
          child: Stack(
            children: [
              Blur(
                blur: 5.0,
                blurColor: Colors.black,
                colorOpacity: 0.5,
                child: Container(color: Colors.transparent),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      Overlay.of(context)?.insert(overlayEntry!);
    }

    return ChangeNotifierProvider(
      create: (_) => PostCardViewModel(),
      child: Consumer<PostCardViewModel>(
        builder: (context, viewModel, child) {
          String content =
              "Hey! Today I literally got my dream job from college placements. Never expected it. lol!";

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/dumpdetail');
            },
            highlightColor: Colors.grey.shade100,
            splashColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Ink(
                // surfaceTintColor: Colors.white,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      trailing: IconButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(color: Colors.grey.shade400),
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                      ),
                      leading: CircleAvatar(
                        // backgroundColor: Colors.black,
                        backgroundImage:
                            AssetImage('assets/images/login image.jpeg'),
                        child: IconButton(
                          onPressed: () {},
                          highlightColor: AppColors.primary.withOpacity(0.2),
                          icon: Icon(
                            Icons.person,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Achintya Singh',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  height: 4,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                '12d',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'SRM IST',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: viewModel.isExpanded
                                  ? content
                                  : (content.length > 50
                                      ? "${content.substring(0, 50)}..."
                                      : content),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontFamily: "Filson",
                              ),
                            ),
                            if (content.length > 50)
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: viewModel.toggleExpanded,
                                  child: Text(
                                    viewModel.isExpanded
                                        ? " Show less"
                                        : " more",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onLongPressStart: (details) {
                            _showFullImage(
                              context,
                              'assets/images/dreamjob.webp',
                            );
                          },
                          onLongPressEnd: (details) {
                            _removeFullImage();
                          },
                          child: SizedBox(
                            height: 300, // Set a fixed height for the image
                            width: double.infinity, // Make it take full width
                            child: Image.asset(
                              'assets/images/dreamjob.webp',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                viewModel.toggleLike();
                              },
                              child: Container(
                                height: 3.7.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    if (viewModel.isLike)
                                      BoxShadow(
                                        color:
                                            Color(0xff21c063).withOpacity(0.4),
                                        blurRadius: 10.0,
                                        spreadRadius: 3.0,
                                        offset: Offset(0.0, 2.0),
                                      ),
                                  ],
                                  color: viewModel.isLike
                                      ? Color(0xff21c063)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: Icon(
                                  Icons.thumb_up,
                                  color: viewModel.isLike
                                      ? Colors.white
                                      : Colors.black,
                                  size: 5.w,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                viewModel.toggleDislike();
                              },
                              child: Container(
                                height: 3.7.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    if (viewModel.isDislike)
                                      BoxShadow(
                                        color:
                                            Color(0xffff5c5c).withOpacity(0.4),
                                        blurRadius: 10.0,
                                        spreadRadius: 3.0,
                                        offset: Offset(0.0, 2.0),
                                      ),
                                  ],
                                  color: viewModel.isDislike
                                      ? Color(0xffff5c5c)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: Icon(
                                  Icons.thumb_down,
                                  color: viewModel.isDislike
                                      ? Colors.white
                                      : Colors.black,
                                  size: 5.w,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Ink(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.4.h, horizontal: 2.w),
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/comment-dots.svg",
                                      height: 2.3.h,
                                      color: Colors.grey.shade600,
                                    ),
                                    SizedBox(width: 0.4.w),
                                    Text(
                                      "357",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Ink(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.4.h, horizontal: 2.w),
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.grey.shade600,
                                      size: 4.w,
                                    ),
                                    SizedBox(width: 0.4.w),
                                    Text(
                                      "357",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
