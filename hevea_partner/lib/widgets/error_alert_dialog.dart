import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog(
      {super.key,
      required this.title,
      required this.errorMessage,
      required this.onPressed});
  final String title;
  final String errorMessage;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing6.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 165.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.negativeRed,
                    fontSize: 24.sp,
                  ),
            ),
            SpacingConst.vSpacing8,
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 19.sp,
                  ),
            ),
            SpacingConst.vSpacing40,
            Center(
              child: CustomButton(
                onPressed: onPressed,
                label: 'Try again',
                style: CustomButtonStyle.primary,
                size: ButtonSize.large,
              ),
            )
          ],
        ),
      ),
    );
  }
}
