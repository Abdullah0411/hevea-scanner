import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/widgets/conditionary_widget/conditionary_widget.dart';
import 'package:hevea_partner/features/auth/login/presentation/screen/login_screen.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/base/presentation/screens/base_screen.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(SessionProviders.sessionStateProvider);
    return ConditionaryWidget(
      condition: sessionState?.isLoggedIn ?? false,
      trueWidget: const BaseScreen(),
      falseWidget: const LoginScreen(),
    );
  }
}
