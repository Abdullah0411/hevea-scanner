import 'dart:convert';

import 'package:hevea_core/environments/environments.dart';
import 'package:hevea_partner/environments/models/api_secrets_environment_variables.dart';

import 'api_keys_environment_variables.dart';

/// A representation of all the environment variables defined in `.env` file
class EnvironmentModel extends Environment {
  EnvironmentModel({
    required EnvironmentType type,
    required this.firebase,
    required this.apiKeys,
    required this.apiSecrets,
  }) : super(type: type);

  final FirebaseEnvironmentVariables? firebase;
  final ApiKeysEnvironmentVariables? apiKeys;
  final ApiSecretsEnvironmentVariables? apiSecrets;

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'firebase': firebase?.toMap(),
      'apiKeys': apiKeys?.toMap(),
      'apiSecrets': apiSecrets?.toMap(),
    };
  }

  factory EnvironmentModel.fromMap(Map<String, dynamic> map) {
    final baseEnvironment = Environment.fromMap(map);

    return EnvironmentModel(
      type: baseEnvironment.type,
      firebase: map['firebase'] != null
          ? FirebaseEnvironmentVariables.fromJson(map['firebase'])
          : null,
      apiKeys: map['apiKeys'] != null
          ? ApiKeysEnvironmentVariables.fromJson(map['apiKeys'])
          : null,
      apiSecrets: map['apiSecrets'] != null
          ? ApiSecretsEnvironmentVariables.fromJson(map['apiSecrets'])
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory EnvironmentModel.fromJson(String source) =>
      EnvironmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'EnvironmentModel(firebase: $firebase, apiKeys: $apiKeys, apiSecrets: $apiSecrets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnvironmentModel &&
        other.firebase == firebase &&
        other.apiKeys == apiKeys &&
        other.apiSecrets == apiSecrets;
  }

  @override
  int get hashCode =>
      firebase.hashCode ^ apiKeys.hashCode ^ apiSecrets.hashCode;
}
