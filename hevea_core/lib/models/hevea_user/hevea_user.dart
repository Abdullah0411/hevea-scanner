import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hevea_core/models/flutter_timestamp.dart';
import 'package:hevea_core/models/hevea_user/enums/gender.dart';
import 'package:hevea_core/models/hevea_user/enums/job.dart';

part 'hevea_user.freezed.dart';
part 'hevea_user.g.dart';

@freezed
class HeveaUser with _$HeveaUser {
  factory HeveaUser({
    required String uid,
    required String name,
    required String phoneNumber,
    @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse) Timestamp? dateOfBirth,
    @Default(Gender.other) Gender gender,
    @Default(Job.other) Job job,
  }) = _HeveaUser;

  factory HeveaUser.fromJson(Map<String, dynamic> json) => _$HeveaUserFromJson(json);
}
