import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/home/providers/home_providers.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    Key? key,
    required this.message,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final String title;
  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing6.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 155.h,
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
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 19.sp,
                  ),
            ),
            SpacingConst.vSpacing32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (context, ref, _) => CustomButton(
                    onPressed: ref
                        .read(HomeProviders.homeScreenControllerProvider)
                        .pop,
                    label: 'Cancel',
                    style: CustomButtonStyle.primary,
                    size: ButtonSize.small,
                  ),
                ),
                CustomButton(
                  onPressed: onPressed,
                  label: 'Logout',
                  color: AppColors.negativeRed,
                  size: ButtonSize.small,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
