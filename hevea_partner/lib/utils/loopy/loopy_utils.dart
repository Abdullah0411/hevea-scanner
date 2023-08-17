import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hevea_partner/environments/services/environment_services.dart';

enum CardType { unlimited, productivity, trail, guest }

class LoopyUtils {
  static const loopyName = 'hevea+';

  static const numberOfStamps = '1';


  static String generateJWT(String partnerName) {
    if (partnerName.isEmpty) {
      return _generateJWT(
        Environment.instance.apiKeys?.loopyLoyalty ?? '',
        Environment.instance.apiSecrets?.loopyLoyalty ?? '',
        'hevea',
      );
    } else {
      return _generateJWT(
        Environment.instance.apiKeys?.loopyLoyalty ?? '',
        Environment.instance.apiSecrets?.loopyLoyalty ?? '',
        'hevea+$partnerName',
      );
    }
  }

  static String generateJWTSystem() {
    return _generateJWT(
      Environment.instance.apiKeys?.loopyLoyalty ?? '',
      Environment.instance.apiSecrets?.loopyLoyalty ?? '',
      'hevea+System',
    );
  }

  static CardType getCardType(String cardId) {
    switch (cardId) {
      case '3ZsKWaBiKu46pfLOZ7mv3h':
        return CardType.unlimited;
      case 'gH6u03myJGdKgopnh5vso':
        return CardType.productivity;
      case '4lKdRvgF4od1puio65jmUz':
        return CardType.trail;
      case '1pXesAFAEEM1wnMPlH16Ex':
        return CardType.guest;
      default:
        throw Exception('Invalid card ID $cardId');
    }
  }

  static String _generateJWT(String key, String secret, String username) {
    final body = {
      'uid': key,
      'exp': (DateTime.now().millisecondsSinceEpoch / 1000).floor() + 3600,
      'iat': (DateTime.now().millisecondsSinceEpoch / 1000).floor() - 10,
      'username': username,
      'pid': key,
    };

    final header = {
      'alg': 'HS256',
      'typ': 'JWT',
    };

    final token = <String>[];
    token.add(base64Url.encode(utf8.encode(jsonEncode(header))));
    token.add(base64Url.encode(utf8.encode(jsonEncode(body))));
    token.add(genTokenSign(token, secret) ?? '');

    return token.join('.');
  }

  static String? genTokenSign(List<String> token, String secret) {
    if (token.length != 2) {
      return null;
    }

    final hmac = Hmac(sha256, utf8.encode(secret));
    final digest = hmac.convert(utf8.encode(token.join('.')));

    return base64Url.encode(digest.bytes);
  }
}
