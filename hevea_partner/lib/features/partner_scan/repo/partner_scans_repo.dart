import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hevea_core/services/firestore_services.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/partner_scan/domain/partner_scan.dart';
import 'package:hevea_core/services/date_util.dart';
import 'package:hevea_partner/utils/api_helper.dart';
import 'package:hevea_partner/utils/loopy/loopy_config.dart';
import 'package:hevea_partner/utils/loopy/loopy_interceptor.dart';
import 'package:hevea_partner/utils/loopy/loopy_utils.dart';

class PartnerScanRepo {
  static Future<List<PartnerScan>> getPartnerScans(
      String partnerName, int year, int month) async {
    try {
      String startDate = DateUtil.getYearAndMonthAndDayAndTimeString(
          DateTime(year, month), "en");

      String endDate = DateUtil.getYearAndMonthAndDayAndTimeString(
          (month == 12)
              ? DateTime(
                  year + 1,
                  month,
                )
              : DateTime(year, month + 1),
          "en");

      QuerySnapshot<Map<String, dynamic>> data = (await FirestoreCollections
          .partnerScans
          .where('partnerName', isEqualTo: partnerName)
          .where('scanDate', isGreaterThanOrEqualTo: startDate)
          .where('scanDate', isLessThan: endDate)
          .get());

      return data.docs.map((e) => PartnerScan.fromJson(e.data())).toList();
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<void> submitPartnerScan(PartnerScan partnerScan) async {
    try {
      await FirestoreCollections.partnerScans
          .doc(partnerScan.id)
          .set(partnerScan.toJson());
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<bool> isExist(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = (await FirestoreCollections
          .partnerScans
          .where('id', isEqualTo: id)
          .get());
      if (data.docs.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<bool> addStamp(String cardId, HeveaPartner partner) async {
    try {
      final response = await LoopyApiInterceptor.loopyClient.post(
        ApiHelper.urlParser(
            '${EndPoint.cardId.endpoint}$cardId${EndPoint.stamp.endpoint}${LoopyUtils.numberOfStamps}'),
        headers: {
          'Authorization': partner.token,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
