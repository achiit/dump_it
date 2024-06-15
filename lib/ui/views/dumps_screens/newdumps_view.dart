import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/shared/widgets/dump_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:blur/blur.dart';

// enum currentvalue { like, dislike, notselected }

class NewDumpsPage extends StatefulWidget {
  @override
  State<NewDumpsPage> createState() => _NewDumpsPageState();
}

class _NewDumpsPageState extends State<NewDumpsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return PostCard();
              },
            ),
          ),
          // SizedBox(height: 10.h)
        ],
      ),
    );
  }
}
