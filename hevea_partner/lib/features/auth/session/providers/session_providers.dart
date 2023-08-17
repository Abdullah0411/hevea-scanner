import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/auth/session/controllers/session_controller.dart';
import 'package:hevea_partner/features/auth/session/domain/session_state.dart';

class SessionProviders {
  static final sessionControllerProvider = StateProvider<SessionController>(
    (ref) => SessionController(ref: ref),
  );

  static final sessionStateProvider =
      StateProvider<SessionState?>((ref) => null);
}
