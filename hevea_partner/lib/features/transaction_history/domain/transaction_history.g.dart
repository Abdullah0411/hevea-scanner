// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionHistory _$$_TransactionHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistory(
      id: json['id'] as String,
      transactionDate: json['transactionDate'] as String,
      partnerScans: (json['partnerScans'] as List<dynamic>)
          .map((e) => PartnerScan.fromJson(e as Map<String, dynamic>))
          .toList(),
      partnerName: json['partnerName'] as String,
      partnerEmail: json['partnerEmail'] as String,
      partnerIban: json['partnerIban'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$_TransactionHistoryToJson(
        _$_TransactionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionDate': instance.transactionDate,
      'partnerScans': instance.partnerScans.map((e) => e.toJson()).toList(),
      'partnerName': instance.partnerName,
      'partnerEmail': instance.partnerEmail,
      'partnerIban': instance.partnerIban,
      'currency': instance.currency,
    };
