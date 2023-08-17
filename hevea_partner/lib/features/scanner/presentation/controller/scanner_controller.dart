import 'dart:developer';

import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_core/utilis/logger/extensions.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/hevea_partner/repo/hevea_partner_repo.dart';
import 'package:hevea_partner/features/loopy_card/domian/loopy_card.dart';
import 'package:hevea_partner/features/loopy_card/providers/card_providers.dart';
import 'package:hevea_partner/features/drinks/presentation/screens/drinks_screen.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:hevea_partner/utils/loopy/jwt_utils.dart';
import 'package:hevea_partner/features/loopy_card/repo/card_repo.dart';

class ScannerController {
  ScannerController({required this.ref});
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  Ref ref;
  late BuildContext context;

  void onDetect(BarcodeCapture capture) async {
    try {
      HeveaPartner? partner =
          ref.read(SessionProviders.sessionStateProvider)?.heveaPartner;
      final isValidToken = JwtUtils.isValidToken(partner!.token.safe(''));
      if (!isValidToken) {
        partner = await HeveaPartnerRepo.login(partner.name, partner.password);
        ref
            .read(SessionProviders.sessionControllerProvider)
            .updateSession(true, partner);
      }

      LoopyCard? card;

      for (final barcode in capture.barcodes) {
        EasyThrottle.throttle('scanner', const Duration(milliseconds: 150),
            () async {
          card = await CardRepo.getCard(barcode.rawValue.safe(''), partner!);

          ref.read(CardProviders.cardProvider.notifier).update((state) => card);
          EasyThrottle.cancel('scanner');
        });
      }
    } catch (e) {
      log(e.toString());
      e.logException();
      rethrow;
    }
  }

  void onCustomerCardPress(LoopyCard card) {
    EasyNavigator.openPage(
        context: context,
        page: DrinksScreen(
          card: card,
        ));
  }
}
