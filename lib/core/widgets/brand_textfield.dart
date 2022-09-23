import 'package:deip/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandTextBox extends StatelessWidget {
  final String name;
  final String errorMessage;
  final bool error;
  final bool? isEmail;
  final bool? obScure;
  final Function? onChanged;
  final TextEditingController controller;
  final Widget? testWidget;
  final Color? boxColor;
  const BrandTextBox(
      {Key? key,
      required this.name,
      required this.controller,
      required this.errorMessage,
      required this.error,
      this.onChanged,
      this.testWidget,
      this.isEmail,
      this.obScure,
      this.boxColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        obscureText: obScure ?? false,
        cursorColor: boxColor ?? AppColors.baseBlue,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: testWidget,
          errorText: (error == true) ? errorMessage : null,
          contentPadding: EdgeInsets.all(2.5.h),
          hintText: name,
          hintStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: boxColor ?? Colors.black54,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: boxColor ?? AppColors.baseBlue,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
