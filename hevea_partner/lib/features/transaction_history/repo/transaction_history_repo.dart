import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hevea_core/services/firestore_services.dart';
import 'package:hevea_core/utilis/logger/extensions.dart';
import 'package:hevea_partner/features/transaction_history/domain/transaction_history.dart';

class TransactionHistoryRepo {
  static Future<TransactionHistory?> getTransactionHistory(
      String userName, String transactionDate) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = (await FirestoreCollections
          .transactionHistory
          .where('partnerName', isEqualTo: userName)
          .where('transactionDate', isEqualTo: transactionDate)
          .get());

      if (data.docs.isEmpty) {
        return null;
      } else {
        return TransactionHistory.fromJson(data.docs.first.data());
      }
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<void> addTransactionHistory(
      TransactionHistory transactionHistory) async {
    try {
      await FirestoreCollections.transactionHistory
          .doc(transactionHistory.id)
          .set(transactionHistory.toJson());
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<bool> isExist(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = (await FirestoreCollections
          .transactionHistory
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
}
