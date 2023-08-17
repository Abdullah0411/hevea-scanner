import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/auth/session/domain/session_manager.dart';
import 'package:hevea_partner/features/auth/session/domain/session_state.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';

class SessionController {
  SessionController({required this.ref});
  Ref ref;
  Future<void> init() async {
    final isLoggedIn = await SessionManager.isUserLoggedIn();
    final heveaPartner = await SessionManager.getHeveaPartner();
    final sessionState = SessionState(
      isLoggedIn: isLoggedIn,
      heveaPartner: heveaPartner,
    );
    ref
        .read(SessionProviders.sessionStateProvider.notifier)
        .update((state) => sessionState);
  }

  Future<void> updateSession(bool isLoggedIn, HeveaPartner partner) async {
    await SessionManager.setUserLoggedIn(isLoggedIn);
    await SessionManager.setHeveaPartnerName(partner.name);
    await SessionManager.setHeveaPartnerPassword(partner.password);
    await SessionManager.setHeveaPartnerToken(partner.token);

    final isSigned = await SessionManager.isUserLoggedIn();
    final heveaPartner = await SessionManager.getHeveaPartner();
    ref.read(SessionProviders.sessionStateProvider.notifier).update((state) {
      return state?.copyWith(
        isLoggedIn: isSigned,
        heveaPartner: heveaPartner,
      );
    });
  }

  Future<void> clearSession() async {
    await SessionManager.clearSession();
  }
}
