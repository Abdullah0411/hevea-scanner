import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hevea_partner/features/customer_details/domain/customer_details.dart';

part 'loopy_card.freezed.dart';
part 'loopy_card.g.dart';

@freezed
class LoopyCard with _$LoopyCard {
  const factory LoopyCard({
    required String id,
    required String campaignId,
    required CustomerDetails customerDetails,
  }) = _LoopyCard;

  factory LoopyCard.fromJson(Map<String, dynamic> json) => _$LoopyCardFromJson(json);
}
