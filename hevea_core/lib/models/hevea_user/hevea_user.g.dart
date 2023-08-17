// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hevea_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeveaUser _$$_HeveaUserFromJson(Map<String, dynamic> json) => _$_HeveaUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: FlutterTimestamp.parse(json['dateOfBirth']),
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.other,
      job: $enumDecodeNullable(_$JobEnumMap, json['job']) ?? Job.other,
    );

Map<String, dynamic> _$$_HeveaUserToJson(_$_HeveaUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': FlutterTimestamp.toMap(instance.dateOfBirth),
      'gender': _$GenderEnumMap[instance.gender]!,
      'job': _$JobEnumMap[instance.job]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$JobEnumMap = {
  Job.student: 'student',
  Job.freelancer: 'freelancer',
  Job.employee: 'employee',
  Job.businessMan: 'businessMan',
  Job.other: 'other',
};
