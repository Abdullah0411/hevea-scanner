import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/features/home/domain/insight_data.dart';
import 'package:hevea_partner/features/home/presentation/controller/home_controller.dart';
import 'package:hevea_partner/features/partner_scan/providers/partner_scan_providers.dart';
import 'package:hevea_partner/features/scans_counter/providers/scans_counter.dart';

class HomeProviders {
  static final homeScreenControllerProvider =
      StateProvider.autoDispose<HomeController>(
    (ref) {
      return HomeController(ref: ref);
    },
  );

  static final homeInsighDataProvider =
      FutureProvider.autoDispose<List<InsightData>>((ref) async {
    final partnerScans = await ref
        .watch(PartnerScanProviders.partnerScanProvider(DateTime.now()).future);
    final totalScans =
        await ref.watch(ScanCountersProviders.scansCounterProvider.future);
    final revenues =
        await ref.watch(PartnerScanProviders.revenuProvider.future);

    return [
      InsightData(
        title: '$totalScans',
        icon: AssetsConst.cups,
        titleColor: AppColors.darkPurple,
        boxColor: AppColors.lightPurple,
        description: 'Total Cups Redeemed',
      ),
      InsightData(
        title: '$revenues SR',
        icon: AssetsConst.revenue,
        titleColor: AppColors.darkGreen,
        boxColor: AppColors.lightGreen,
        description: 'Total Revenue Generated this month',
      ),
      InsightData(
        title: partnerScans.length.toString(),
        boxColor: AppColors.lightOrange,
        titleColor: AppColors.darkOrange,
        description: 'Number of visitors this month',
        icon: AssetsConst.usersGroup,
      ),
      InsightData(
        title: 'History',
        icon: AssetsConst.transactionHistory,
        titleColor: AppColors.darkBlue,
        boxColor: AppColors.lightBlue,
        description: 'Transaction history',
      )
    ];
  });
}
