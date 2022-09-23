import 'package:deip/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandButton extends StatelessWidget {
  final VoidCallback? function;
  final bool? options;
  final bool? cancel;
  final String? title;
  final Color? color;
  final Color? titleColor;

  const BrandButton(
      {Key? key,
      this.function,
      this.options,
      this.cancel,
      this.title,
      this.color,
      this.titleColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.w),
        ),
        foregroundColor: Colors.black,
        fixedSize: Size(95.w, 6.h),
        backgroundColor: color ?? AppColors.baseBlue,
      ),
      onPressed: function,
      child: Text(
        title ?? 'Confirm',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
    );
  }
}
