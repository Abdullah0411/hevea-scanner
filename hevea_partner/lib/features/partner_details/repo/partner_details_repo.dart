import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;
import 'package:hevea_core/services/firestore_services.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/partner_details/domain/partner_details.dart';

class PartnerDetailsRepo {
  static Future<PartnerDetails> getPartnerDetails(String userName) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = (await FirestoreCollections
          .partnerDetails
          .where('partnerName', isEqualTo: userName)
          .get());

      return PartnerDetails.fromJson(data.docs.first.data());
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
