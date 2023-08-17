// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PartnerScan _$$_PartnerScanFromJson(Map<String, dynamic> json) =>
    _$_PartnerScan(
      partnerName: json['partnerName'] as String,
      drink: json['drink'] as Map<String, dynamic>,
      scanDate: json['scanDate'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_PartnerScanToJson(_$_PartnerScan instance) =>
    <String, dynamic>{
      'partnerName': instance.partnerName,
      'drink': instance.drink,
      'scanDate': instance.scanDate,
      'id': instance.id,
    };
