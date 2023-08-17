import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/home/presentation/widgets/insight_loading.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';

class PartnerInsightsLoading extends StatelessWidget {
  const PartnerInsightsLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) => null).listToWidgets(
            (element) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const InsightLoading(),
            ),
          ),
        ),
        SpacingConst.vSpacing16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) => null).listToWidgets(
            (element) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const InsightLoading(),
            ),
          ),
        ),
      ],
    );
  }
}
