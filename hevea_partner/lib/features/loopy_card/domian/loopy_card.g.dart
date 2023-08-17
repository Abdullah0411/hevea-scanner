// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loopy_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoopyCard _$$_LoopyCardFromJson(Map<String, dynamic> json) => _$_LoopyCard(
      id: json['id'] as String,
      campaignId: json['campaignId'] as String,
      customerDetails: CustomerDetails.fromJson(
          json['customerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoopyCardToJson(_$_LoopyCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campaignId': instance.campaignId,
      'customerDetails': instance.customerDetails.toJson(),
    };
