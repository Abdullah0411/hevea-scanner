// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scans_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScansCounter _$ScansCounterFromJson(Map<String, dynamic> json) {
  return _ScansCounter.fromJson(json);
}

/// @nodoc
mixin _$ScansCounter {
  int get scans => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScansCounterCopyWith<ScansCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScansCounterCopyWith<$Res> {
  factory $ScansCounterCopyWith(
          ScansCounter value, $Res Function(ScansCounter) then) =
      _$ScansCounterCopyWithImpl<$Res, ScansCounter>;
  @useResult
  $Res call({int scans});
}

/// @nodoc
class _$ScansCounterCopyWithImpl<$Res, $Val extends ScansCounter>
    implements $ScansCounterCopyWith<$Res> {
  _$ScansCounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scans = null,
  }) {
    return _then(_value.copyWith(
      scans: null == scans
          ? _value.scans
          : scans // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScansCounterCopyWith<$Res>
    implements $ScansCounterCopyWith<$Res> {
  factory _$$_ScansCounterCopyWith(
          _$_ScansCounter value, $Res Function(_$_ScansCounter) then) =
      __$$_ScansCounterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int scans});
}

/// @nodoc
class __$$_ScansCounterCopyWithImpl<$Res>
    extends _$ScansCounterCopyWithImpl<$Res, _$_ScansCounter>
    implements _$$_ScansCounterCopyWith<$Res> {
  __$$_ScansCounterCopyWithImpl(
      _$_ScansCounter _value, $Res Function(_$_ScansCounter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scans = null,
  }) {
    return _then(_$_ScansCounter(
      scans: null == scans
          ? _value.scans
          : scans // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScansCounter implements _ScansCounter {
  const _$_ScansCounter({required this.scans});

  factory _$_ScansCounter.fromJson(Map<String, dynamic> json) =>
      _$$_ScansCounterFromJson(json);

  @override
  final int scans;

  @override
  String toString() {
    return 'ScansCounter(scans: $scans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScansCounter &&
            (identical(other.scans, scans) || other.scans == scans));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scans);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScansCounterCopyWith<_$_ScansCounter> get copyWith =>
      __$$_ScansCounterCopyWithImpl<_$_ScansCounter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScansCounterToJson(
      this,
    );
  }
}

abstract class _ScansCounter implements ScansCounter {
  const factory _ScansCounter({required final int scans}) = _$_ScansCounter;

  factory _ScansCounter.fromJson(Map<String, dynamic> json) =
      _$_ScansCounter.fromJson;

  @override
  int get scans;
  @override
  @JsonKey(ignore: true)
  _$$_ScansCounterCopyWith<_$_ScansCounter> get copyWith =>
      throw _privateConstructorUsedError;
}
