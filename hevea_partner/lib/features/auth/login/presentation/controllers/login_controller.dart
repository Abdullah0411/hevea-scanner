import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_core/services/validator.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:hevea_partner/features/auth/login/providers/login_providers.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/base/presentation/screens/base_screen.dart';
import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';
import 'package:hevea_partner/features/hevea_partner/repo/hevea_partner_repo.dart';

class LoginController {
  LoginController({required this.ref});
  Ref ref;
  late BuildContext context;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? isValidPassword(String password) {
    if (!Validator.isValidatePassword(password)) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  String? isValidName(String name) {
    if (!Validator.safeIsNotEmpty(name)) {
      return 'Name is Empty';
    } else {
      return null;
    }
  }

  void popAlert() {
    EasyNavigator.popPage(context);
  }

  void login() async {
    try {
      final password = passwordController.text;
      final userName = nameController.text;
      if (Validator.isValidatePassword(password) &&
          Validator.safeIsNotEmpty(userName)) {
        // final partner = await HeveaPartnerRepo.login(
        //   userName,
        //   password,
        // );
        ref.read(SessionProviders.sessionControllerProvider).updateSession(true,
            HeveaPartner(name: 'Testing', password: 'Aa112233!', token: '123'));
        ref
            .read(LoginProviders.loginProvider.notifier)
            .update((state) => state.copyWith(isLoggedIn: true));

        EasyNavigator.openPage(
          isPushReplaced: true,
          context: context,
          isCupertinoStyle: false,
          page: const BaseScreen(),
        );
      }
    } catch (e) {
      ref.read(LoginProviders.loginProvider.notifier).update((state) =>
          state.copyWith(
              isLoggedIn: false,
              errorMessage: e.toString().replaceAll('Exception: ', '')));
      e.logException();
    }
  }

  void logout() {
    ref.read(SessionProviders.sessionControllerProvider).clearSession();
    EasyNavigator.popToFirstView(context);
  }
}
