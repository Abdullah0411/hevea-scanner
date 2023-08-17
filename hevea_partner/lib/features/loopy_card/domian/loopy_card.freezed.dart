// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loopy_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoopyCard _$LoopyCardFromJson(Map<String, dynamic> json) {
  return _LoopyCard.fromJson(json);
}

/// @nodoc
mixin _$LoopyCard {
  String get id => throw _privateConstructorUsedError;
  String get campaignId => throw _privateConstructorUsedError;
  CustomerDetails get customerDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoopyCardCopyWith<LoopyCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoopyCardCopyWith<$Res> {
  factory $LoopyCardCopyWith(LoopyCard value, $Res Function(LoopyCard) then) =
      _$LoopyCardCopyWithImpl<$Res, LoopyCard>;
  @useResult
  $Res call({String id, String campaignId, CustomerDetails customerDetails});

  $CustomerDetailsCopyWith<$Res> get customerDetails;
}

/// @nodoc
class _$LoopyCardCopyWithImpl<$Res, $Val extends LoopyCard>
    implements $LoopyCardCopyWith<$Res> {
  _$LoopyCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? campaignId = null,
    Object? customerDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      customerDetails: null == customerDetails
          ? _value.customerDetails
          : customerDetails // ignore: cast_nullable_to_non_nullable
              as CustomerDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerDetailsCopyWith<$Res> get customerDetails {
    return $CustomerDetailsCopyWith<$Res>(_value.customerDetails, (value) {
      return _then(_value.copyWith(customerDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoopyCardCopyWith<$Res> implements $LoopyCardCopyWith<$Res> {
  factory _$$_LoopyCardCopyWith(
          _$_LoopyCard value, $Res Function(_$_LoopyCard) then) =
      __$$_LoopyCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String campaignId, CustomerDetails customerDetails});

  @override
  $CustomerDetailsCopyWith<$Res> get customerDetails;
}

/// @nodoc
class __$$_LoopyCardCopyWithImpl<$Res>
    extends _$LoopyCardCopyWithImpl<$Res, _$_LoopyCard>
    implements _$$_LoopyCardCopyWith<$Res> {
  __$$_LoopyCardCopyWithImpl(
      _$_LoopyCard _value, $Res Function(_$_LoopyCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? campaignId = null,
    Object? customerDetails = null,
  }) {
    return _then(_$_LoopyCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      customerDetails: null == customerDetails
          ? _value.customerDetails
          : customerDetails // ignore: cast_nullable_to_non_nullable
              as CustomerDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoopyCard implements _LoopyCard {
  const _$_LoopyCard(
      {required this.id,
      required this.campaignId,
      required this.customerDetails});

  factory _$_LoopyCard.fromJson(Map<String, dynamic> json) =>
      _$$_LoopyCardFromJson(json);

  @override
  final String id;
  @override
  final String campaignId;
  @override
  final CustomerDetails customerDetails;

  @override
  String toString() {
    return 'LoopyCard(id: $id, campaignId: $campaignId, customerDetails: $customerDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoopyCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.customerDetails, customerDetails) ||
                other.customerDetails == customerDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, campaignId, customerDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoopyCardCopyWith<_$_LoopyCard> get copyWith =>
      __$$_LoopyCardCopyWithImpl<_$_LoopyCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoopyCardToJson(
      this,
    );
  }
}

abstract class _LoopyCard implements LoopyCard {
  const factory _LoopyCard(
      {required final String id,
      required final String campaignId,
      required final CustomerDetails customerDetails}) = _$_LoopyCard;

  factory _LoopyCard.fromJson(Map<String, dynamic> json) =
      _$_LoopyCard.fromJson;

  @override
  String get id;
  @override
  String get campaignId;
  @override
  CustomerDetails get customerDetails;
  @override
  @JsonKey(ignore: true)
  _$$_LoopyCardCopyWith<_$_LoopyCard> get copyWith =>
      throw _privateConstructorUsedError;
}
