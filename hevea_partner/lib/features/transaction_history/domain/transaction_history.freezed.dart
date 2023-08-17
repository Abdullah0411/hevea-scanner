// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  String get id => throw _privateConstructorUsedError;
  String get transactionDate => throw _privateConstructorUsedError;
  List<PartnerScan> get partnerScans => throw _privateConstructorUsedError;
  String get partnerName => throw _privateConstructorUsedError;
  String get partnerEmail => throw _privateConstructorUsedError;
  String get partnerIban => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {String id,
      String transactionDate,
      List<PartnerScan> partnerScans,
      String partnerName,
      String partnerEmail,
      String partnerIban,
      String currency});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionDate = null,
    Object? partnerScans = null,
    Object? partnerName = null,
    Object? partnerEmail = null,
    Object? partnerIban = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      partnerScans: null == partnerScans
          ? _value.partnerScans
          : partnerScans // ignore: cast_nullable_to_non_nullable
              as List<PartnerScan>,
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      partnerEmail: null == partnerEmail
          ? _value.partnerEmail
          : partnerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      partnerIban: null == partnerIban
          ? _value.partnerIban
          : partnerIban // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$_TransactionHistoryCopyWith(_$_TransactionHistory value,
          $Res Function(_$_TransactionHistory) then) =
      __$$_TransactionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String transactionDate,
      List<PartnerScan> partnerScans,
      String partnerName,
      String partnerEmail,
      String partnerIban,
      String currency});
}

/// @nodoc
class __$$_TransactionHistoryCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$_TransactionHistory>
    implements _$$_TransactionHistoryCopyWith<$Res> {
  __$$_TransactionHistoryCopyWithImpl(
      _$_TransactionHistory _value, $Res Function(_$_TransactionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionDate = null,
    Object? partnerScans = null,
    Object? partnerName = null,
    Object? partnerEmail = null,
    Object? partnerIban = null,
    Object? currency = null,
  }) {
    return _then(_$_TransactionHistory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      partnerScans: null == partnerScans
          ? _value._partnerScans
          : partnerScans // ignore: cast_nullable_to_non_nullable
              as List<PartnerScan>,
      partnerName: null == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String,
      partnerEmail: null == partnerEmail
          ? _value.partnerEmail
          : partnerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      partnerIban: null == partnerIban
          ? _value.partnerIban
          : partnerIban // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistory implements _TransactionHistory {
  const _$_TransactionHistory(
      {required this.id,
      required this.transactionDate,
      required final List<PartnerScan> partnerScans,
      required this.partnerName,
      required this.partnerEmail,
      required this.partnerIban,
      required this.currency})
      : _partnerScans = partnerScans;

  factory _$_TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryFromJson(json);

  @override
  final String id;
  @override
  final String transactionDate;
  final List<PartnerScan> _partnerScans;
  @override
  List<PartnerScan> get partnerScans {
    if (_partnerScans is EqualUnmodifiableListView) return _partnerScans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partnerScans);
  }

  @override
  final String partnerName;
  @override
  final String partnerEmail;
  @override
  final String partnerIban;
  @override
  final String currency;

  @override
  String toString() {
    return 'TransactionHistory(id: $id, transactionDate: $transactionDate, partnerScans: $partnerScans, partnerName: $partnerName, partnerEmail: $partnerEmail, partnerIban: $partnerIban, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            const DeepCollectionEquality()
                .equals(other._partnerScans, _partnerScans) &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            (identical(other.partnerEmail, partnerEmail) ||
                other.partnerEmail == partnerEmail) &&
            (identical(other.partnerIban, partnerIban) ||
                other.partnerIban == partnerIban) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      transactionDate,
      const DeepCollectionEquality().hash(_partnerScans),
      partnerName,
      partnerEmail,
      partnerIban,
      currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      __$$_TransactionHistoryCopyWithImpl<_$_TransactionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {required final String id,
      required final String transactionDate,
      required final List<PartnerScan> partnerScans,
      required final String partnerName,
      required final String partnerEmail,
      required final String partnerIban,
      required final String currency}) = _$_TransactionHistory;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistory.fromJson;

  @override
  String get id;
  @override
  String get transactionDate;
  @override
  List<PartnerScan> get partnerScans;
  @override
  String get partnerName;
  @override
  String get partnerEmail;
  @override
  String get partnerIban;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
