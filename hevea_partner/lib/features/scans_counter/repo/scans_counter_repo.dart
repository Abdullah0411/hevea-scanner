import 'package:hevea_core/services/firestore_services.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/scans_counter/domain/scans_counter.dart';

class ScansCounterRepo {
  static Future<ScansCounter> getScanCounters(String partnerName) async {
    try {
      Map<String, dynamic> data =
          (await FirestoreCollections.scansCounters.doc('total').get()).data()!;
      if (data['partners'][partnerName] == null) {
        return const ScansCounter(scans: 0);
      } else {
        final partnerData =
            ScansCounter.fromJson(data['partners'][partnerName]);

        return partnerData;
      }
    } catch (e) {
      e.logException();
      rethrow;
    }
  } //TODO: ask hady about new partners not in the document
}
