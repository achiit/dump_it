import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dump_it/ui/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
