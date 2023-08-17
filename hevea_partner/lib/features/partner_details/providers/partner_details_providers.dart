import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/partner_details/domain/partner_details.dart';
import 'package:hevea_partner/features/partner_details/repo/partner_details_repo.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';

class PartnerDetailsProviders {
  static final partnerDetailsProvider =
      FutureProvider<PartnerDetails>((ref) async {
    try {
      final partnerName =
          ref.watch(SessionProviders.sessionStateProvider)?.heveaPartner.name;
      final partnerDetails =
          await PartnerDetailsRepo.getPartnerDetails(partnerName.safe(''));

      return partnerDetails;
    } catch (e) {
      rethrow;
    }
  });
}
