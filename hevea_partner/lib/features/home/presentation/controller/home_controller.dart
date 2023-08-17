import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_partner/features/auth/login/presentation/screen/login_screen.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/transaction_history/presentation/screens/transaction_history_screen.dart';

class HomeController {
  HomeController({required this.ref});
  Ref ref;
  late BuildContext context;

  void onHistoryTap() {
    EasyNavigator.openPage(
      isCupertinoStyle: false,
      context: context,
      page: const TransactionHistoryScreen(),
    );
  }

  void pop() {
    EasyNavigator.popPage(context);
  }

  void logout() {
    ref.read(SessionProviders.sessionControllerProvider).clearSession();
    EasyNavigator.openPage(
      context: context,
      isPushReplaced: true,
      isCupertinoStyle: false,
      page: const LoginScreen(),
    );
  }
}
