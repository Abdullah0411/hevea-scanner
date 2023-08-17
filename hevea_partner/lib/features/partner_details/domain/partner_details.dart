import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_details.freezed.dart';
part 'partner_details.g.dart';

@freezed
class PartnerDetails with _$PartnerDetails {
  const factory PartnerDetails({
    required String partnerName,
    required Map<String, dynamic> drinks,
    required String currency,
    required String email,
    required String iban,
  }) = _PartnerDetails;

  factory PartnerDetails.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsFromJson(json);
}
