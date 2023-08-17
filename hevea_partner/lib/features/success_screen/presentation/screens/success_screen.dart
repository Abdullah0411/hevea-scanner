import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/success_screen/providers/success_providers.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';

class SuccessScreen extends ConsumerWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(SuccessProviders.successScreenControllerProvider);
    controller.context = context;
    return Sheet(
      children: [
        SpacingConst.vSpacing16,
        Image.asset(
          AssetsConst.hevea,
        ),
        Text(
          'TRANSACTION SUCCESS',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.positiveGreen,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
        ),
        SpacingConst.vSpacing16,
        Text(
          'Your Dashboard will be updated shortly',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 14.5.sp),
        ),
        SpacingConst.vSpacing120,
        CustomButton(
          onPressed: controller.onHomeButtonPressed,
          label: 'Home',
          size: ButtonSize.large,
          style: CustomButtonStyle.primary,
        ),
      ],
    );
  }
}
