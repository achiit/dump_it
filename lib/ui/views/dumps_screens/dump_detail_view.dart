import 'package:auto_size_text/auto_size_text.dart';
import 'package:dump_it/app/app.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/shared/widgets/dump_card.dart';
import 'package:dump_it/ui/shared/widgets/dump_detail_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DumpDetail extends StatelessWidget {
  const DumpDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: AutoSizeText(
          'Dump',
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DumpDetailCard(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/login image.jpeg"),
                      radius: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          hintText: 'Reply',
                          hintStyle: TextStyle(fontSize: 12.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
