import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_partner/constants/icons/hevea_partner_icons.dart';
import 'package:hevea_partner/constants/spacing_const.dart';

class MonthData extends StatelessWidget {
  final bool showLine;
  const MonthData(
      {Key? key,
      this.showLine = false,
      required this.label,
      required this.onPressed})
      : super(key: key);
  final String label;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing20.toDouble()),
      child: Row(
        children: [
          Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 55,
                  maxWidth: 45,
                ),
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppColors.naturalGrey,
                    ),
                  ),
                ),
              ),
              showLine
                  ? Container(
                      width: 1.w,
                      height: 30.h,
                      color: AppColors.naturalGrey,
                    )
                  : SizedBox(
                      height: 30.h,
                    ),
            ],
          ),
          SpacingConst.hSpacing16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 0.1.h,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: 'Cairo',
                    ),
              ),
              Text(
                'Download this month data',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.6.h,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.sp,
                      fontFamily: 'Cairo',
                    ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: Icon(
              HeveaPartnerIcons.download,
              size: 30.sp,
            ),
          ),
        ],
      ),
    );
  }
}
