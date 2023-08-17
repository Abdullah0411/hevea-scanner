import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key,
      required this.onPressed,
      this.backgroundColor = AppColors.white});

  final Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 70,
          maxHeight: 70,
        ),
        child: Container(
            height: 44.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.darkPurple,
              ),
            )),
      ),
    );
  }
}
