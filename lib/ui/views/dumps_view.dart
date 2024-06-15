import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/views/dumps_screens/hot_view.dart';
import 'package:dump_it/ui/views/dumps_screens/newdumps_view.dart';
import 'package:dump_it/ui/views/dumps_screens/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DumpsView extends StatefulWidget {
  const DumpsView({super.key});

  @override
  _DumpsViewState createState() => _DumpsViewState();
}

class _DumpsViewState extends State<DumpsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentValue = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentValue = _tabController.index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: Text(
          'Dumps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontFamily: "Nexa Bold",
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: Adaptive.w(5),
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomSlidingSegmentedControl<int>(
              padding: 10,
              innerPadding: EdgeInsets.all(12),
              initialValue: _currentValue,
              children: {
                1: Row(
                  children: [
                    if (_currentValue == 1)
                      SvgPicture.asset(
                            "assets/images/rocketicon.svg",
                            color: Colors.white,
                          ) ??
                          Container(),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'New Dumps   ',
                      style: TextStyle(
                        color: _currentValue == 1
                            ? Colors.white
                            : Color(0xffb3aeb9),
                        fontFamily: "Nexa Bold",
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
                2: Row(
                  children: [
                    if (_currentValue == 2)
                      SvgPicture.asset(
                            "assets/images/hoticon.svg",
                            height: 20,
                            color: Colors.white,
                          ) ??
                          Container(),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Hot  ',
                      style: TextStyle(
                        color: _currentValue == 2
                            ? Colors.white
                            : Color(0xffb3aeb9),
                        fontFamily: "Nexa Bold",
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
                3: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (_currentValue == 3)
                      SvgPicture.asset(
                            "assets/images/qandaicon.svg",
                            color: Colors.white,
                          ) ??
                          Container(),
                    Text(
                      'Questions  ',
                      style: TextStyle(
                        color: _currentValue == 3
                            ? Colors.white
                            : Color(0xffb3aeb9),
                        fontFamily: "Nexa Bold",
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                )
              },
              decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(12),
              ),
              thumbDecoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 10.0,
                    spreadRadius: 3.0,
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInToLinear,
              onValueChanged: (int value) {
                _tabController.index = value - 1;
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                NewDumpsPage(),
                HotDumpsPage(),
                QuestionsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
