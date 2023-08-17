import 'dart:convert';
import 'dart:io';
import 'package:hevea_partner/utils/loopy/loopy_interceptor.dart';
import 'package:hevea_partner/utils/loopy/loopy_utils.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/utils/api_helper.dart';
import 'package:hevea_partner/utils/loopy/loopy_config.dart';

class HeveaPartnerRepo {
  static Future<HeveaPartner> login(String name, String password) async {
    try {
      String body = jsonEncode(
          {"username": '${LoopyUtils.loopyName}$name', "password": password});

      final response = await LoopyApiInterceptor.loopyClient.post(
        ApiHelper.urlParser(EndPoint.login.endpoint),
        body: body,
      );

      if (response.statusCode == HttpStatus.unauthorized) {
        throw Exception('Incorrect username or password');
      } else if (response.statusCode != HttpStatus.ok) {
        throw Exception('Unexpected server error');
      }
      Map<String, dynamic> json = {
        "name": name,
        "password": password,
        "token": jsonDecode(response.body)['token'],
      };

      return HeveaPartner.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
