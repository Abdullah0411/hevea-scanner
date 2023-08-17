// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartnerDetails _$PartnerDetailsFromJson(Map<String, dynamic> json) {
  return _PartnerDetails.fromJson(json);
}

/// @nodoc
mixin _$PartnerDetails {
  String get partnerName => throw _privateConstructorUsedError;
  Map<String, dynamic> get drinks => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerDetailsCopyWith<PartnerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerDetailsCopyWith<$Res> {
  factory $PartnerDetailsCopyWith(
          PartnerDetails value, $Res Function(PartnerDetails) then) =
      _$PartnerDetailsCopyWithImpl<$Res, PartnerDetails>;
  @useResult
  $Res call(
      {String partnerName,
      Map<String, dynamic> drinks,
      String currency,
      String email,
      String iban});
}

/// @nodoc
class _$PartnerDetailsCopyWithImpl<$Res, $Val extends PartnerDetails>
    implements $PartnerDetailsCopyWith<$Res> {
  _$PartnerDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerName = null,
    Object? drinks = null,
    Object? currency = null,
    Object? email = null,
    Object? iban = null,
  }) {
    return _then(_value.copyWith(
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PartnerDetailsCopyWith<$Res>
    implements $PartnerDetailsCopyWith<$Res> {
  factory _$$_PartnerDetailsCopyWith(
          _$_PartnerDetails value, $Res Function(_$_PartnerDetails) then) =
      __$$_PartnerDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String partnerName,
      Map<String, dynamic> drinks,
      String currency,
      String email,
      String iban});
}

/// @nodoc
class __$$_PartnerDetailsCopyWithImpl<$Res>
    extends _$PartnerDetailsCopyWithImpl<$Res, _$_PartnerDetails>
    implements _$$_PartnerDetailsCopyWith<$Res> {
  __$$_PartnerDetailsCopyWithImpl(
      _$_PartnerDetails _value, $Res Function(_$_PartnerDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerName = null,
    Object? drinks = null,
    Object? currency = null,
    Object? email = null,
    Object? iban = null,
  }) {
    return _then(_$_PartnerDetails(
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PartnerDetails implements _PartnerDetails {
  const _$_PartnerDetails(
      {required this.partnerName,
      required final Map<String, dynamic> drinks,
      required this.currency,
      required this.email,
      required this.iban})
      : _drinks = drinks;

  factory _$_PartnerDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerDetailsFromJson(json);

  @override
  final String partnerName;
  final Map<String, dynamic> _drinks;
  @override
  Map<String, dynamic> get drinks {
    if (_drinks is EqualUnmodifiableMapView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_drinks);
  }

  @override
  final String currency;
  @override
  final String email;
  @override
  final String iban;

  @override
  String toString() {
    return 'PartnerDetails(partnerName: $partnerName, drinks: $drinks, currency: $currency, email: $email, iban: $iban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PartnerDetails &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.iban, iban) || other.iban == iban));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partnerName,
      const DeepCollectionEquality().hash(_drinks), currency, email, iban);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PartnerDetailsCopyWith<_$_PartnerDetails> get copyWith =>
      __$$_PartnerDetailsCopyWithImpl<_$_PartnerDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerDetailsToJson(
      this,
    );
  }
}

abstract class _PartnerDetails implements PartnerDetails {
  const factory _PartnerDetails(
      {required final String partnerName,
      required final Map<String, dynamic> drinks,
      required final String currency,
      required final String email,
      required final String iban}) = _$_PartnerDetails;

  factory _PartnerDetails.fromJson(Map<String, dynamic> json) =
      _$_PartnerDetails.fromJson;

  @override
  String get partnerName;
  @override
  Map<String, dynamic> get drinks;
  @override
  String get currency;
  @override
  String get email;
  @override
  String get iban;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerDetailsCopyWith<_$_PartnerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
