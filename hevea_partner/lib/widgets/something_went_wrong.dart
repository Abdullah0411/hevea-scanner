import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/constants.dart';

class SomthingWentWrong extends StatelessWidget {
  const SomthingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Sheet(
      children: [
        Text(
          'Something went wrong!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.negativeRed,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
        ),
      ],
    );
  }
}
