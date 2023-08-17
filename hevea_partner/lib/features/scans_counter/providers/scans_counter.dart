import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/scans_counter/repo/scans_counter_repo.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';

class ScanCountersProviders {
  static final scansCounterProvider = FutureProvider<int>(
    (ref) async {
      String? partnerName =
          ref.watch(SessionProviders.sessionStateProvider)?.heveaPartner.name;
      final scanCounter = await ScansCounterRepo.getScanCounters(
        partnerName.safe(''),
      );

      return scanCounter.scans;
    },
  );
}
