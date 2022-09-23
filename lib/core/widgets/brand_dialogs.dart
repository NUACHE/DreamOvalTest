import 'package:another_flushbar/flushbar.dart';
import 'package:deip/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

//Loading dialog
showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 18.w,
        height: 18.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.baseBlue),
          ),
        ),
      ),
    ),
  );
}

//App alerts
showFlushAlert(context, message, {bgColor, mgColor}) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    message: "$message",
    duration: const Duration(seconds: 3),
    messageColor: mgColor ?? Colors.white,
    backgroundColor: bgColor ?? AppColors.baseBlue,
  )..show(context);
}

//Bottom sheets
brandBottomSheet(context, {key, height, enableDrag}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: enableDrag ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return SizedBox(
          height: height,
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 15.h,
                  ),
                  Text(
                    'Success',
                    style: TextStyle(fontSize: 3.h),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
