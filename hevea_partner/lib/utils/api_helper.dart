import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:http/http.dart' as http;
import 'package:hevea_partner/utils/loopy/loopy_config.dart';

class ApiHelper {
  static Uri urlParser(String endPoint) {
    return Uri.parse('${LoopyConfigs.apiPath}$endPoint');
  }

  static Future<http.Response> post(
      {required String endPoint,
      required String partnerName,
      String? token,
      Object? body}) async {
    try {
      Map<String, String> requestHeaders =
          LoopyConfigs.getHeaders(partnerName: partnerName, token: token);

      Uri url = urlParser(endPoint);

      http.Response response =
          await http.post(url, headers: requestHeaders, body: body);

      return response;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  static Future<http.Response> get({
    required String endPoint,
    required String partnerName,
    required String token,
  }) async {
    try {
      Map<String, String> requestHeaders =
          LoopyConfigs.getHeaders(partnerName: partnerName, token: token);
      Uri url = urlParser(endPoint);

      http.Response response = await http.get(url, headers: requestHeaders);

      return response;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
