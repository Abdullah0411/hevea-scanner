// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PartnerDetails _$$_PartnerDetailsFromJson(Map<String, dynamic> json) =>
    _$_PartnerDetails(
      partnerName: json['partnerName'] as String,
      drinks: json['drinks'] as Map<String, dynamic>,
      currency: json['currency'] as String,
      email: json['email'] as String,
      iban: json['iban'] as String,
    );

Map<String, dynamic> _$$_PartnerDetailsToJson(_$_PartnerDetails instance) =>
    <String, dynamic>{
      'partnerName': instance.partnerName,
      'drinks': instance.drinks,
      'currency': instance.currency,
      'email': instance.email,
      'iban': instance.iban,
    };
