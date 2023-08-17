import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_scan.freezed.dart';
part 'partner_scan.g.dart';

@freezed
class PartnerScan with _$PartnerScan {
  const factory PartnerScan({
    required String partnerName,
    required Map<String, dynamic> drink,
    required String scanDate,
    required String id,
  }) = _PartnerScan;

  factory PartnerScan.fromJson(Map<String, dynamic> json) =>
      _$PartnerScanFromJson(json);
}
