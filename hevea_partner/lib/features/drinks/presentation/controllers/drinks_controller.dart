import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/services/date_util.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_core/utilis/logger/extensions.dart';
import 'package:hevea_core/utilis/uuid.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/drinks/domain/stamp_state.dart';
import 'package:hevea_partner/features/drinks/providers/drinks_providers.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/hevea_partner/repo/hevea_partner_repo.dart';
import 'package:hevea_partner/features/home/providers/home_providers.dart';
import 'package:hevea_partner/features/partner_scan/domain/partner_scan.dart';
import 'package:hevea_partner/features/success_screen/presentation/screens/success_screen.dart';
import 'package:hevea_partner/features/partner_scan/repo/partner_scans_repo.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:hevea_partner/utils/loopy/jwt_utils.dart';

class DrinkController {
  DrinkController({required this.ref});
  Ref ref;
  late BuildContext context;
  int attempts = 0;

  Future<void> onSubmit(Map<String, dynamic> drink, String cardId) async {
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

      final isStamped = await PartnerScanRepo.addStamp(cardId, partner);
      if (isStamped) {
        String id = Uuid.generate;
        bool isExist = await PartnerScanRepo.isExist(id);
        while (isExist) {
          id = Uuid.generate;
          isExist = await PartnerScanRepo.isExist(id);
        }
        final partnerScan = PartnerScan(
          drink: drink,
          id: id,
          partnerName: partner.name.safe(''),
          scanDate:
              DateUtil.getYearAndMonthAndDayAndTimeString(DateTime.now(), "en"),
        );
        await PartnerScanRepo.submitPartnerScan(partnerScan);
        EasyNavigator.openPage(
          isCupertinoStyle: false,
          isPushReplaced: true,
          context: context,
          page: const SuccessScreen(),
        );
        ref.refresh(HomeProviders.homeInsighDataProvider.future);
      } else {
        ref.read(DrinksProviders.stampsProvider.notifier).update((state) =>
            StampState(isStamped: false, message: 'Something went wrong'));
      }
    } catch (e) {
      ref.read(DrinksProviders.stampsProvider.notifier).update((state) =>
          StampState(isStamped: false, message: 'Something went wrong'));
      e.logException();
      rethrow;
    }
  }

  void popAlert() {
    EasyNavigator.popPage(context);
  }
}
