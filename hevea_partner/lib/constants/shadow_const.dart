import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/app_colors.dart';

class ShadowConst {
  static final blackShadow = BoxShadow(
    color: AppColors.black.withOpacity(0.1),
    blurRadius: 3,
    spreadRadius: 1,
  );
  static final lightGreyShadow = BoxShadow(
    color: AppColors.lightGrey.withOpacity(0.4),
    spreadRadius: 2,
    blurRadius: 6,
  );

  static final lightShadow = BoxShadow(
    color: AppColors.lightGrey.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 5,
    offset: const Offset(1, 1),
  );
}
