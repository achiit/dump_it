// import 'package:bottom_picker/bottom_picker.dart';
// import 'package:dump_it/ui/shared/widgets/college_selector.dart';
// import 'package:dump_it/ui/shared/widgets/custom_textfield.dart';
// import 'package:dump_it/ui/shared/widgets/year_picker_field.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:dump_it/ui/shared/colors.dart';
// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

// class FillDetailsView2 extends StatefulWidget {
//   const FillDetailsView2({super.key});

//   @override
//   _FillDetailsView2State createState() => _FillDetailsView2State();
// }

// class _FillDetailsView2State extends State<FillDetailsView2>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   int selectedSegment = 0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.bounceOut,
//     );

//     // Start the animation
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     fullNameController.dispose();
//     usernameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/home');
//             },
//             child: Text(
//               "Skip",
//               style: TextStyle(
//                 decoration: TextDecoration.underline,
//                 decorationColor: AppColors.primary,
//                 color: AppColors.primary,
//                 fontSize: 14.sp,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Stack(
//             children: [
//               AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   return Align(
//                     alignment: Alignment(
//                         0,
//                         1 -
//                             _animation.value *
//                                 2), // Move from center (0) to top (-1)
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Who you are? 🏫',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: 30.sp,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Nexa Bold',
//                           ),
//                         ),
//                         Text(
//                           'We\'re excited to know more about you! 🚀',
//                           style: TextStyle(
//                             fontSize: 10.sp,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         _buildForm(),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20.h),
//                   height: 7.h,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: AppColors.primary,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 2,
//                       ),
//                     ),
//                     child: Text(
//                       "Next",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.sp,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, '/home');
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select your status:",
//             style: TextStyle(
//               fontSize: 12.sp,
//             ),
//           ),
//           SizedBox(height: 10),
//           CustomSlidingSegmentedControl<int>(
//             initialValue: 0,
//             fixedWidth: 29.w,
//             children: {
//               0: Text(
//                 "Learner",
//                 style: TextStyle(
//                   fontSize: 10.sp,
//                   color: selectedSegment == 0 ? Colors.white : Colors.black,
//                 ),
//               ),
//               1: Text(
//                 "Undergrad",
//                 style: TextStyle(
//                   fontSize: 10.sp,
//                   color: selectedSegment == 1 ? Colors.white : Colors.black,
//                 ),
//               ),
//               2: Text(
//                 "Pro",
//                 style: TextStyle(
//                   fontSize: 10.sp,
//                   color: selectedSegment == 2 ? Colors.white : Colors.black,
//                 ),
//               ),
//             },
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 2,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             thumbDecoration: BoxDecoration(
//               color: AppColors.primary,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 2,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             onValueChanged: (v) {
//               setState(() {
//                 selectedSegment = v;
//               });
//             },
//           ),
//           if (selectedSegment == 1) ...[
//             SizedBox(height: 20),
//             Text(
//               "Where are you studying? 🏫",
//               style: TextStyle(
//                 fontSize: 12.sp,
//               ),
//             ),
//             CollegeSearchField(),
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Start Year",
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                       YearPickerField(
//                         label: 'Start Year',
//                         yearRange:
//                             List<int>.generate(54, (index) => 1975 + index),
//                         controller: fullNameController,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "End Year",
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                       YearPickerField(
//                         label: 'End Year',
//                         yearRange:
//                             List<int>.generate(54, (index) => 1975 + index),
//                         controller: fullNameController,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.grey[400]!,
//                 ),
//               ),
//               child: Text(
//                   "Example: If your degree is B.Sc in Chemistry, then select Bachelor of Science (B.Sc) in degree and Chemistry in streams."),
//             )
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:dump_it/ui/shared/widgets/college_selector.dart';
import 'package:dump_it/ui/shared/widgets/custom_textfield.dart';
import 'package:dump_it/ui/shared/widgets/year_picker_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:dump_it/ui/shared/colors.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class FillDetailsView2 extends StatefulWidget {
  const FillDetailsView2({super.key});

  @override
  _FillDetailsView2State createState() => _FillDetailsView2State();
}

class _FillDetailsView2State extends State<FillDetailsView2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController streamController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();

  List<String> collegeSuggestions = [];
  List<String> streamSuggestions = [];
  List<String> degreeSuggestions = [];

  int selectedSegment = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    collegeController.dispose();
    streamController.dispose();
    degreeController.dispose();
    super.dispose();
  }

  Future<void> _getStreamSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        streamSuggestions = [];
      });
      return;
    }

    final url = 'https://internshala.com/autocomplete/stream/$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        setState(() {
          streamSuggestions = List<String>.from(data['result']);
        });
      } else {
        setState(() {
          streamSuggestions = [];
        });
      }
    } else {
      setState(() {
        streamSuggestions = [];
      });
    }
  }

  Future<void> _getCollegeSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        collegeSuggestions = [];
      });
      return;
    }

    final url = 'https://internshala.com/autocomplete/college/$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        setState(() {
          collegeSuggestions = List<String>.from(data['result']);
        });
      } else {
        setState(() {
          collegeSuggestions = [];
        });
      }
    } else {
      setState(() {
        collegeSuggestions = [];
      });
    }
  }

  Future<void> _getdegreeSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        degreeSuggestions = [];
      });
      return;
    }

    final url = 'https://internshala.com/autocomplete/degree/$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        setState(() {
          degreeSuggestions = List<String>.from(data['result']);
        });
      } else {
        setState(() {
          degreeSuggestions = [];
        });
      }
    } else {
      setState(() {
        degreeSuggestions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text(
              "Skip",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
                color: AppColors.primary,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Align(
                    alignment: Alignment(
                        0,
                        1 -
                            _animation.value *
                                2), // Move from center (0) to top (-1)
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who you are? 🏫',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nexa Bold',
                          ),
                        ),
                        Text(
                          'We\'re excited to know more about you! 🚀',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildForm(),
                      ],
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 20.h),
                  height: 7.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2,
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select your status:",
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 10),
          CustomSlidingSegmentedControl<int>(
            initialValue: 0,
            fixedWidth: 29.w,
            children: {
              0: Text(
                "Learner",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: selectedSegment == 0 ? Colors.white : Colors.black,
                ),
              ),
              1: Text(
                "Undergrad",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: selectedSegment == 1 ? Colors.white : Colors.black,
                ),
              ),
              2: Text(
                "Pro",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: selectedSegment == 2 ? Colors.white : Colors.black,
                ),
              ),
            },
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            thumbDecoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
            ),
            onValueChanged: (v) {
              setState(() {
                selectedSegment = v;
              });
            },
          ),
          if (selectedSegment == 1)
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Where are you studying? 🏫",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                CollegeSearchField(
                  hintText: 'Enter college name',
                  onTap: () {
                    collegeController.clear();
                    setState(() {
                      collegeSuggestions = [];
                    });
                  },
                  controller: collegeController,
                  suggestions: collegeSuggestions,
                  onChanged: _getCollegeSuggestions,
                  onSuggestionSelected: (value) {
                    setState(() {
                      collegeController.text = value;
                      collegeSuggestions = [];
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Year",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          YearPickerField(
                            label: 'Start Year',
                            yearRange:
                                List<int>.generate(54, (index) => 1975 + index),
                            controller: fullNameController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Year",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          YearPickerField(
                            label: 'End Year',
                            yearRange:
                                List<int>.generate(54, (index) => 1975 + index),
                            controller: fullNameController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "What stream you are in? 🏫",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                CollegeSearchField(
                  hintText: 'Enter Stream name',
                  onTap: () {
                    streamController.clear();
                    setState(() {
                      streamSuggestions = [];
                    });
                  },
                  controller: streamController,
                  suggestions: streamSuggestions,
                  onChanged: _getStreamSuggestions,
                  onSuggestionSelected: (value) {
                    setState(() {
                      streamController.text = value;
                      streamSuggestions = [];
                    });
                  },
                ),
                Text(
                  "What Degree you are you Pursuing? 🏫",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                CollegeSearchField(
                  hintText: 'Enter Degree name',
                  onTap: () {
                    degreeController.clear();
                    setState(() {
                      degreeSuggestions = [];
                    });
                  },
                  controller: degreeController,
                  suggestions: degreeSuggestions,
                  onChanged: _getdegreeSuggestions,
                  onSuggestionSelected: (value) {
                    setState(() {
                      degreeController.text = value;
                      degreeSuggestions = [];
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Text(
                      "Example: If your degree is B.Sc in Chemistry, then select Bachelor of Science (B.Sc) in degree and Chemistry in streams."),
                )
              ],
            ))
        ],
      ),
    );
  }
}
