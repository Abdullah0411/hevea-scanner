// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hevea_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeveaUser _$HeveaUserFromJson(Map<String, dynamic> json) {
  return _HeveaUser.fromJson(json);
}

/// @nodoc
mixin _$HeveaUser {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
  Timestamp? get dateOfBirth => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  Job get job => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeveaUserCopyWith<HeveaUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeveaUserCopyWith<$Res> {
  factory $HeveaUserCopyWith(HeveaUser value, $Res Function(HeveaUser) then) =
      _$HeveaUserCopyWithImpl<$Res, HeveaUser>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String phoneNumber,
      @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
          Timestamp? dateOfBirth,
      Gender gender,
      Job job});
}

/// @nodoc
class _$HeveaUserCopyWithImpl<$Res, $Val extends HeveaUser>
    implements $HeveaUserCopyWith<$Res> {
  _$HeveaUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? dateOfBirth = freezed,
    Object? gender = null,
    Object? job = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeveaUserCopyWith<$Res> implements $HeveaUserCopyWith<$Res> {
  factory _$$_HeveaUserCopyWith(
          _$_HeveaUser value, $Res Function(_$_HeveaUser) then) =
      __$$_HeveaUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String phoneNumber,
      @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
          Timestamp? dateOfBirth,
      Gender gender,
      Job job});
}

/// @nodoc
class __$$_HeveaUserCopyWithImpl<$Res>
    extends _$HeveaUserCopyWithImpl<$Res, _$_HeveaUser>
    implements _$$_HeveaUserCopyWith<$Res> {
  __$$_HeveaUserCopyWithImpl(
      _$_HeveaUser _value, $Res Function(_$_HeveaUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? dateOfBirth = freezed,
    Object? gender = null,
    Object? job = null,
  }) {
    return _then(_$_HeveaUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeveaUser implements _HeveaUser {
  _$_HeveaUser(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
          this.dateOfBirth,
      this.gender = Gender.other,
      this.job = Job.other});

  factory _$_HeveaUser.fromJson(Map<String, dynamic> json) =>
      _$$_HeveaUserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
  final Timestamp? dateOfBirth;
  @override
  @JsonKey()
  final Gender gender;
  @override
  @JsonKey()
  final Job job;

  @override
  String toString() {
    return 'HeveaUser(uid: $uid, name: $name, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, job: $job)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeveaUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, phoneNumber, dateOfBirth, gender, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeveaUserCopyWith<_$_HeveaUser> get copyWith =>
      __$$_HeveaUserCopyWithImpl<_$_HeveaUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeveaUserToJson(
      this,
    );
  }
}

abstract class _HeveaUser implements HeveaUser {
  factory _HeveaUser(
      {required final String uid,
      required final String name,
      required final String phoneNumber,
      @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
          final Timestamp? dateOfBirth,
      final Gender gender,
      final Job job}) = _$_HeveaUser;

  factory _HeveaUser.fromJson(Map<String, dynamic> json) =
      _$_HeveaUser.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  @JsonKey(toJson: FlutterTimestamp.toMap, fromJson: FlutterTimestamp.parse)
  Timestamp? get dateOfBirth;
  @override
  Gender get gender;
  @override
  Job get job;
  @override
  @JsonKey(ignore: true)
  _$$_HeveaUserCopyWith<_$_HeveaUser> get copyWith =>
      throw _privateConstructorUsedError;
}
