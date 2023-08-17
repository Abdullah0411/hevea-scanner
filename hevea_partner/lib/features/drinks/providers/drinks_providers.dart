import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/drinks/domain/stamp_state.dart';
import 'package:hevea_partner/features/drinks/presentation/controllers/drinks_controller.dart';
import 'package:hevea_partner/features/partner_details/providers/partner_details_providers.dart';

class DrinksProviders {
  static final drinksProvider =
      FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
    final partnerDetails =
        await ref.watch(PartnerDetailsProviders.partnerDetailsProvider.future);

    return partnerDetails.drinks;
  });

  static final drinksScreenControllerProvider =
      StateProvider.autoDispose<DrinkController>((ref) {
    return DrinkController(ref: ref);
  });

  static final stampsProvider = StateProvider.autoDispose<StampState>((ref) {
    return StampState(isStamped: true);
  });
}
