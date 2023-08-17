import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hevea_partner/features/partner_scan/domain/partner_scan.dart';

part 'transaction_history.freezed.dart';
part 'transaction_history.g.dart';

@freezed
class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    required String id,
    required String transactionDate,
    required List<PartnerScan> partnerScans,
    required String partnerName,
    required String partnerEmail,
    required String partnerIban,
    required String currency,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}
