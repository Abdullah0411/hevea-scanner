import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/home/domain/insight_data.dart';

class Insight extends StatelessWidget {
  const Insight({
    super.key,
    required this.insight,
  });

  final InsightData insight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 250,
        maxHeight: 250,
      ),
      child: Container(
        height: 165.h,
        width: 158.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grey,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpacingConst.vSpacing16,
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 100,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: insight.boxColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  height: 65.h,
                  width: 65.w,
                  child: Center(
                    child: SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: SvgPicture.asset(
                        insight.icon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SpacingConst.vSpacing6,
              Text(
                insight.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 17.sp, color: insight.titleColor),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SpacingConst.spacing16.toDouble()),
                child: Text(
                  insight.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.lightGrey, fontSize: 12.5.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
