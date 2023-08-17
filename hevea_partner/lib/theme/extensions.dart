import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/app_colors.dart';

extension TextThemes on BuildContext {
  TextTheme get textThemes {
    return Theme.of(this).textTheme;
  }
}

extension StyleChange on TextStyle {
  /// Having this return type will allow us to use the chain calling,
  /// i.e
  /// ```
  /// Theme.of(context).textTheme.bodyLard.regular().copyWith()... or Theme.of(context).textTheme.bodyLard.copyWith().regular()
  /// ```
  TextStyle get regular {
    return copyWith(
        fontWeight: FontWeight.w400, color: AppColors.gunmetalLight);
  }

  /// The default is medium, make sure that you need this function.
  TextStyle get medium {
    return copyWith(
        fontWeight: FontWeight.w500, color: AppColors.gunmetalLight);
  }

  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300, color: AppColors.lightGrey);
  }
}
