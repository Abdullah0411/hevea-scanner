import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/home/domain/insight_data.dart';
import 'package:hevea_partner/features/home/presentation/widgets/insight.dart';
import 'package:hevea_partner/features/home/providers/home_providers.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';

class PartnerInsights extends ConsumerWidget {
  const PartnerInsights({super.key, required this.insights});
  final List<InsightData> insights;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(HomeProviders.homeScreenControllerProvider);
    controller.context = context;
    final firstRow = insights.sublist(0, 2);
    final secondRow = insights.sublist(2, 4);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: firstRow.listToWidgets(
            (element) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Insight(
                insight: element,
              ),
            ),
          ),
        ),
        SpacingConst.vSpacing16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secondRow.listToWidgets((element) {
            return element != secondRow.last
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Insight(
                      insight: element,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: GestureDetector(
                      onTap: controller.onHistoryTap,
                      child: Insight(
                        insight: element,
                      ),
                    ),
                  );
          }),
        ),
      ],
    );
  }
}
