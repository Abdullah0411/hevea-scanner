import 'dart:convert';

/// A representation of all the api keys used across all the platforms.
class ApiKeysEnvironmentVariables {
  final String googleMaps;
  final String amplitude;
  final String sentryKey;
  final String loopyLoyalty;
  ApiKeysEnvironmentVariables(
      {required this.googleMaps,
      required this.amplitude,
      required this.sentryKey,
      required this.loopyLoyalty});

  ApiKeysEnvironmentVariables copyWith(
      {String? googleMaps,
      String? amplitude,
      String? sentryKey,
      String? loopyLoyalty}) {
    return ApiKeysEnvironmentVariables(
        googleMaps: googleMaps ?? this.googleMaps,
        amplitude: amplitude ?? this.amplitude,
        sentryKey: sentryKey ?? this.sentryKey,
        loopyLoyalty: loopyLoyalty ?? this.loopyLoyalty);
  }

  Map<String, dynamic> toMap() {
    return {
      'googleMaps': googleMaps,
      'amplitude': amplitude,
      'sentryKey': sentryKey,
      'loopyLoyalty': loopyLoyalty
    };
  }

  factory ApiKeysEnvironmentVariables.fromMap(Map<String, dynamic> map) {
    return ApiKeysEnvironmentVariables(
        googleMaps: map['googleMaps'] ?? '',
        amplitude: map['amplitude'] ?? '',
        sentryKey: map['sentryKey'] ?? '',
        loopyLoyalty: map['loopyLoyalty'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory ApiKeysEnvironmentVariables.fromJson(String source) =>
      ApiKeysEnvironmentVariables.fromMap(json.decode(source));

  @override
  String toString() =>
      'ApiKeysEnvironmentVariables(googleMaps: $googleMaps, amplitude: $amplitude, sentryKey: $sentryKey, loopyLoyalty: $loopyLoyalty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiKeysEnvironmentVariables &&
        other.googleMaps == googleMaps &&
        other.amplitude == amplitude &&
        other.sentryKey == sentryKey &&
        other.loopyLoyalty == loopyLoyalty;
  }

  @override
  int get hashCode =>
      googleMaps.hashCode ^
      amplitude.hashCode ^
      sentryKey.hashCode ^
      loopyLoyalty.hashCode;
}
