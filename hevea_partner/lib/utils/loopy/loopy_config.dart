import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:hevea_partner/utils/loopy/loopy_utils.dart';

class LoopyConfigs {
  static const host = 'loopyloyalty.com';
  static const scheme = 'https';
  static const apiVersion = 'v1';
  static const apiPath = '$scheme://api.$host/$apiVersion';

  static Map<String, String> getHeaders(
      {required String partnerName, String? token}) {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json, text/plain, */*",
      "User-Agent": "Loopy Loyalty Scanner iOS v2.0.4",
    };

    if (partnerName.isNotEmpty) {
      headers["Authorization"] =
          token.safe(LoopyUtils.generateJWT(partnerName));
    }
    return headers;
  }
}

enum EndPoint {
  login('/account/login'),
  card('/card/'),
  campaign('/campaign/id/'),
  cardId('/card/cid/'),
  stamp('/addStamps/');

  const EndPoint(this.endpoint);
  final String endpoint;
}
