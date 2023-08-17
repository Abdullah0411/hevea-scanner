import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/constants/constants.dart';
import 'package:hevea_partner/constants/constants.dart';

class DrinkCard extends StatelessWidget {
  DrinkCard({
    super.key,
    this.isSelected = false,
    required this.name,
  });
  final String name;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 162.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lightPurple : AppColors.white,
        borderRadius: largeBorderRadius,
        boxShadow: [
          ShadowConst.lightShadow,
        ],
      ),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
