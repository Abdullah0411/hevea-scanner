import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_core/widgets/custom_textfield/textfield_types.dart';

class CustomTextFieldWidgetController {
  Color getTextFieldColor(TextFieldType type, bool isValid, bool showValid) {
    if (type == TextFieldType.active) {
      return AppColors.primary;
    } else if (isValid) {
      if (showValid) {
        return AppColors.positiveGreen;
      } else {
        return Colors.grey;
      }
    } else {
      return AppColors.negativeRed;
    }
  }
}
