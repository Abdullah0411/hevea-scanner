import 'dart:convert';

/// A representation of all the api keys used across all the platforms.
class ApiSecretsEnvironmentVariables {
  final String loopyLoyalty;
  ApiSecretsEnvironmentVariables({required this.loopyLoyalty});

  ApiSecretsEnvironmentVariables copyWith({String? loopyLoyalty}) {
    return ApiSecretsEnvironmentVariables(
        loopyLoyalty: loopyLoyalty ?? this.loopyLoyalty);
  }

  Map<String, dynamic> toMap() {
    return {'loopyLoyalty': loopyLoyalty};
  }

  factory ApiSecretsEnvironmentVariables.fromMap(Map<String, dynamic> map) {
    return ApiSecretsEnvironmentVariables(
        loopyLoyalty: map['loopyLoyalty'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory ApiSecretsEnvironmentVariables.fromJson(String source) =>
      ApiSecretsEnvironmentVariables.fromMap(json.decode(source));

  @override
  String toString() =>
      'ApiSecretsEnvironmentVariables(loopyLoyalty: $loopyLoyalty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiSecretsEnvironmentVariables &&
        other.loopyLoyalty == loopyLoyalty;
  }

  @override
  int get hashCode => loopyLoyalty.hashCode;
}
