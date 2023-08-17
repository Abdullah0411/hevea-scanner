import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:hevea_partner/utils/extensions/string_extensions.dart';

class SessionManager {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _heveaPartnerName = 'heveaPartnerName';
  static const String _heveaPartnerPassword = 'heveaPartnerPassword';
  static const String _heveaPartnerToken = 'heveaPartnerToken';

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    await _storage.write(key: _isLoggedInKey, value: isLoggedIn.toString());
  }

  static Future<void> setHeveaPartnerName(String name) async {
    await _storage.write(key: _heveaPartnerName, value: name);
  }

  static Future<void> setHeveaPartnerPassword(String password) async {
    await _storage.write(key: _heveaPartnerPassword, value: password);
  }

  static Future<void> setHeveaPartnerToken(String token) async {
    await _storage.write(key: _heveaPartnerToken, value: token);
  }

  static Future<bool> isUserLoggedIn() async {
    final isLoggedIn = await _storage.read(key: _isLoggedInKey);
    return isLoggedIn != null ? isLoggedIn.toBool() : false;
  }

  static Future<HeveaPartner> getHeveaPartner() async {
    final partnerName = (await _storage.read(key: _heveaPartnerName)).safe('');
    final partnerPassword =
        (await _storage.read(key: _heveaPartnerPassword)).safe('');
    final partnerToken =
        (await _storage.read(key: _heveaPartnerToken)).safe('');
    return HeveaPartner(
      name: partnerName,
      password: partnerPassword,
      token: partnerToken,
    );
  }

  static Future<void> clearSession() async {
    await _storage.delete(key: _isLoggedInKey);
    await _storage.delete(key: _heveaPartnerName);
    await _storage.delete(key: _heveaPartnerPassword);
    await _storage.delete(key: _heveaPartnerToken);
  }
}
