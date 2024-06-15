import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class YearPickerField extends StatelessWidget {
  final String label;
  final List<int> yearRange;
  final TextEditingController controller;

  YearPickerField({
    required this.label,
    required this.yearRange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<int>(
        value: yearRange.first,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        items: yearRange.map((int year) {
          return DropdownMenuItem<int>(
            value: year,
            child: Text(year.toString()),
          );
        }).toList(),
        onChanged: (int? newValue) {
          controller.text = newValue.toString();
        },
      ),
    );
  }
}
