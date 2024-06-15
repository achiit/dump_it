import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dump_it/app/app.dart';
import 'package:dump_it/ui/shared/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dump_it/ui/shared/colors.dart';

class FillDetailsView extends StatefulWidget {
  const FillDetailsView({super.key});

  @override
  _FillDetailsViewState createState() => _FillDetailsViewState();
}

class _FillDetailsViewState extends State<FillDetailsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      children: [
                        Text(
                          'Hey Hi,\nLet\'s Define Your Vibe 🔥🦄',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nexa Bold',
                          ),
                        ),
                        Text(
                          'Unlock exclusive college insights! Complete your profile today. 🎓🔓',
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
                      // "Count Me In! 🚀",
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/filldetails2');
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
            "What\'s your name?🌟",
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          CustomTextField(
            hintText: 'Full Name',
            controller: fullNameController,
          ),
          Text(
            "You were born in? 🎂",
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BottomPicker.date(
              pickerTitle: Text(
                '',
              ),
              backgroundColor: Colors.grey[200]!,
              dateOrder: DatePickerDateOrder.dmy,
              initialDateTime: DateTime(1996, 10, 22),
              maxDateTime: DateTime(2025),
              minDateTime: DateTime(1975),
              pickerTextStyle: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  fontFamily: "Filson"),
              onChange: (index) {
                print(index);
              },
              onSubmit: (index) {
                print(index);
              },
              displaySubmitButton: false,
              onClose: () => print('onClose'),
              closeIconColor: Colors.grey[200]!,
              bottomPickerTheme: BottomPickerTheme.plumPlate,
            ),
          )
        ],
      ),
    );
  }
}
