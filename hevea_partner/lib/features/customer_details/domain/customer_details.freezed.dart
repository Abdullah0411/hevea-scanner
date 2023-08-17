// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) {
  return _CustomerDetails.fromJson(json);
}

/// @nodoc
mixin _$CustomerDetails {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDetailsCopyWith<CustomerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDetailsCopyWith<$Res> {
  factory $CustomerDetailsCopyWith(
          CustomerDetails value, $Res Function(CustomerDetails) then) =
      _$CustomerDetailsCopyWithImpl<$Res, CustomerDetails>;
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class _$CustomerDetailsCopyWithImpl<$Res, $Val extends CustomerDetails>
    implements $CustomerDetailsCopyWith<$Res> {
  _$CustomerDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerDetailsCopyWith<$Res>
    implements $CustomerDetailsCopyWith<$Res> {
  factory _$$_CustomerDetailsCopyWith(
          _$_CustomerDetails value, $Res Function(_$_CustomerDetails) then) =
      __$$_CustomerDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class __$$_CustomerDetailsCopyWithImpl<$Res>
    extends _$CustomerDetailsCopyWithImpl<$Res, _$_CustomerDetails>
    implements _$$_CustomerDetailsCopyWith<$Res> {
  __$$_CustomerDetailsCopyWithImpl(
      _$_CustomerDetails _value, $Res Function(_$_CustomerDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$_CustomerDetails(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerDetails implements _CustomerDetails {
  const _$_CustomerDetails({required this.name, required this.phone});

  factory _$_CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDetailsFromJson(json);

  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'CustomerDetails(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDetails &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDetailsCopyWith<_$_CustomerDetails> get copyWith =>
      __$$_CustomerDetailsCopyWithImpl<_$_CustomerDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDetailsToJson(
      this,
    );
  }
}

abstract class _CustomerDetails implements CustomerDetails {
  const factory _CustomerDetails(
      {required final String name,
      required final String phone}) = _$_CustomerDetails;

  factory _CustomerDetails.fromJson(Map<String, dynamic> json) =
      _$_CustomerDetails.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDetailsCopyWith<_$_CustomerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
