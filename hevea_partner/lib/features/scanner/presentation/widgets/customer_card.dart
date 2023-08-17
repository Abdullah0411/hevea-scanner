import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/customer_details/domain/customer_details.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard(
      {super.key, required this.customerDetails, required this.onPressed});
  final CustomerDetails? customerDetails;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraintsCone.cardTabletConstraint,
        child: Container(
          height: 75.h,
          width: 250.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [ShadowConst.lightGreyShadow],
          ),
          padding: EdgeInsets.all(SpacingConst.spacing8.toDouble()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpacingConst.hSpacing60,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   customerDetails?.campaignName ?? '',
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                  Text(
                    customerDetails?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 65,
                  maxHeight: 65,
                ),
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.infoBlue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    size: 45.sp,
                    color: AppColors.white,
                    Icons.add_rounded,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
