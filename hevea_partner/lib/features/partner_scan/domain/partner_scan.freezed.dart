// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_scan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartnerScan _$PartnerScanFromJson(Map<String, dynamic> json) {
  return _PartnerScan.fromJson(json);
}

/// @nodoc
mixin _$PartnerScan {
  String get partnerName => throw _privateConstructorUsedError;
  Map<String, dynamic> get drink => throw _privateConstructorUsedError;
  String get scanDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerScanCopyWith<PartnerScan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerScanCopyWith<$Res> {
  factory $PartnerScanCopyWith(
          PartnerScan value, $Res Function(PartnerScan) then) =
      _$PartnerScanCopyWithImpl<$Res, PartnerScan>;
  @useResult
  $Res call(
      {String partnerName,
      Map<String, dynamic> drink,
      String scanDate,
      String id});
}

/// @nodoc
class _$PartnerScanCopyWithImpl<$Res, $Val extends PartnerScan>
    implements $PartnerScanCopyWith<$Res> {
  _$PartnerScanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerName = null,
    Object? drink = null,
    Object? scanDate = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      drink: null == drink
          ? _value.drink
          : drink // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scanDate: null == scanDate
          ? _value.scanDate
          : scanDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PartnerScanCopyWith<$Res>
    implements $PartnerScanCopyWith<$Res> {
  factory _$$_PartnerScanCopyWith(
          _$_PartnerScan value, $Res Function(_$_PartnerScan) then) =
      __$$_PartnerScanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String partnerName,
      Map<String, dynamic> drink,
      String scanDate,
      String id});
}

/// @nodoc
class __$$_PartnerScanCopyWithImpl<$Res>
    extends _$PartnerScanCopyWithImpl<$Res, _$_PartnerScan>
    implements _$$_PartnerScanCopyWith<$Res> {
  __$$_PartnerScanCopyWithImpl(
      _$_PartnerScan _value, $Res Function(_$_PartnerScan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerName = null,
    Object? drink = null,
    Object? scanDate = null,
    Object? id = null,
  }) {
    return _then(_$_PartnerScan(
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      drink: null == drink
          ? _value._drink
          : drink // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scanDate: null == scanDate
          ? _value.scanDate
          : scanDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PartnerScan implements _PartnerScan {
  const _$_PartnerScan(
      {required this.partnerName,
      required final Map<String, dynamic> drink,
      required this.scanDate,
      required this.id})
      : _drink = drink;

  factory _$_PartnerScan.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerScanFromJson(json);

  @override
  final String partnerName;
  final Map<String, dynamic> _drink;
  @override
  Map<String, dynamic> get drink {
    if (_drink is EqualUnmodifiableMapView) return _drink;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_drink);
  }

  @override
  final String scanDate;
  @override
  final String id;

  @override
  String toString() {
    return 'PartnerScan(partnerName: $partnerName, drink: $drink, scanDate: $scanDate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PartnerScan &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            const DeepCollectionEquality().equals(other._drink, _drink) &&
            (identical(other.scanDate, scanDate) ||
                other.scanDate == scanDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partnerName,
      const DeepCollectionEquality().hash(_drink), scanDate, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PartnerScanCopyWith<_$_PartnerScan> get copyWith =>
      __$$_PartnerScanCopyWithImpl<_$_PartnerScan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerScanToJson(
      this,
    );
  }
}

abstract class _PartnerScan implements PartnerScan {
  const factory _PartnerScan(
      {required final String partnerName,
      required final Map<String, dynamic> drink,
      required final String scanDate,
      required final String id}) = _$_PartnerScan;

  factory _PartnerScan.fromJson(Map<String, dynamic> json) =
      _$_PartnerScan.fromJson;

  @override
  String get partnerName;
  @override
  Map<String, dynamic> get drink;
  @override
  String get scanDate;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerScanCopyWith<_$_PartnerScan> get copyWith =>
      throw _privateConstructorUsedError;
}
