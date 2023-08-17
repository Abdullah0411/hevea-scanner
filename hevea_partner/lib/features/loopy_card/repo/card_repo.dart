import 'dart:convert';
import 'dart:io';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/loopy_card/domian/loopy_card.dart';
import 'package:hevea_partner/utils/api_helper.dart';
import 'package:hevea_partner/utils/loopy/loopy_config.dart';
import 'package:hevea_partner/utils/loopy/loopy_interceptor.dart';

class CardRepo {
  static Future<LoopyCard> getCard(String cardId, HeveaPartner partner) async {
    try {
      final cardResponse = await LoopyApiInterceptor.loopyClient.get(
        ApiHelper.urlParser('${EndPoint.card.endpoint}$cardId'),
        headers: {
          'Authorization': partner.token,
        },
      );
      if (cardResponse.statusCode != HttpStatus.ok) {
        throw Exception('Unexpected server error');
      }
      final cardJson = jsonDecode(utf8.decode(cardResponse.bodyBytes));

      final card = LoopyCard.fromJson(cardJson['card']);

      // final campaignResponse = await LoopyApiInterceptor.loopyClient.get(
      //   ApiHelper.urlParser('${EndPoint.campaign.endpoint}${card.campaignId}'),
      //   headers: {
      //     'Authorization': partner.token,
      //   },
      // );

      // if (campaignResponse.statusCode != HttpStatus.ok) {
      //   throw Exception('Unexpected server error');
      // }
      // final campaignJson = jsonDecode(utf8.decode(campaignResponse.bodyBytes));
      return card;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
