import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/partner_scan/domain/partner_scan.dart';
import 'package:hevea_partner/features/partner_scan/repo/partner_scans_repo.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';

class PartnerScanProviders {
  static final partnerScanProvider = FutureProvider.family
      .autoDispose<List<PartnerScan>, DateTime>((ref, date) async {
    try {
      String? partnerName =
          ref.watch(SessionProviders.sessionStateProvider)?.heveaPartner.name;

      final partnerScans = await PartnerScanRepo.getPartnerScans(
          partnerName.safe(''), date.year, date.month);

      return partnerScans;
    } catch (e) {
      e.logException();
      rethrow;
    }
  });

  static final revenuProvider = FutureProvider.autoDispose<double>((ref) async {
    final partnerScans =
        await ref.read(partnerScanProvider(DateTime.now()).future);
    final totalRevenue = partnerScans.fold<double>(
        0.0,
        (previousValue, partnerScan) =>
            previousValue + partnerScan.drink.values.first);
    return totalRevenue;
  });
}
