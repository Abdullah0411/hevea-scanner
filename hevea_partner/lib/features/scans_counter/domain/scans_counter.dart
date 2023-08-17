import 'package:freezed_annotation/freezed_annotation.dart';

part 'scans_counter.freezed.dart';
part 'scans_counter.g.dart';

@freezed
class ScansCounter with _$ScansCounter {
  const factory ScansCounter({
    required int scans,
  }) = _ScansCounter;

  factory ScansCounter.fromJson(Map<String, dynamic> json) =>
      _$ScansCounterFromJson(json);
}
