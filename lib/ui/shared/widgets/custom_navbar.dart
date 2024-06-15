import 'dart:developer';

import 'package:dump_it/data/models/rive_assets.dart';
import 'package:dump_it/ui/shared/widgets/animated_bar.dart';
import 'package:dump_it/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<Widget> pages; // Add this line

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.pages, // Add this line
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var selectedBottomNav = bottomNavs.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            bottomNavs.length,
            (index) => GestureDetector(
              onTap: () {
                bottomNavs[index].input?.change(true);
                if (bottomNavs[index] != selectedBottomNav) {
                  setState(() {
                    selectedBottomNav = bottomNavs[index];
                  });
                  widget.onTap(index); 
                }
                Future.delayed(const Duration(seconds: 1), () {
                  bottomNavs[index].input?.change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                      child: bottomNavs[index].runtimeType == RiveAsset
                          ? RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);

                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            )
                          : InkWell(
                              onTap: () {
                                if (bottomNavs[index] != selectedBottomNav) {
                                  log(index.toString());
                                  setState(() {
                                    selectedBottomNav = bottomNavs[index];
                                  });
                                  widget.onTap(
                                    index,
                                  ); 
                                }
                              },
                              child: Lottie.asset("assets/images/add icons .json",
                                                                    ),
                            ),
              
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
