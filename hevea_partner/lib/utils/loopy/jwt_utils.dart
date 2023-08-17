import 'dart:convert';
import 'package:hevea_core/services/date_util.dart';

class JwtUtils {
  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static Map<String, dynamic> parseJwtHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[0]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static bool isValidToken(String? token) {
    if (token == null) {
      return false;
    }

    final payload = parseJwtPayLoad(token);

    final expireDate = DateUtil.fromIntToDateTime(payload['exp']);

    if (DateUtil.now.millisecondsSinceEpoch <
        expireDate
            .subtract(const Duration(seconds: 30))
            .millisecondsSinceEpoch) {
      return true;
    } else {
      return false;
    }
  }
}
