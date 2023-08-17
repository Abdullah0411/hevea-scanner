import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/auth/login/domain/login_state.dart';
import 'package:hevea_partner/features/auth/login/presentation/controllers/login_controller.dart';

class LoginProviders {
  static final loginScreenControllerProvider =
      StateProvider.autoDispose<LoginController>((ref) {
    return LoginController(ref: ref);
  });

  static final loginProvider = StateProvider.autoDispose<LoginState>((ref) {
    return LoginState(isLoggedIn: false);
  });
}
