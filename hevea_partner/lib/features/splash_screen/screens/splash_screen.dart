import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/assets_const.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/initializer.dart';
import 'package:hevea_partner/features/splash_screen/controllers/splash_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late SplashScreenController controller;

  @override
  void initState() {
    controller = SplashScreenController(context: context, ref: ref);
    ref.read(SessionProviders.sessionControllerProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: Initializer.initAll(),
            builder: (context, snapshot) {
              controller.checkInitialization(snapshot: snapshot);

              return Center(
                child: Image.asset(AssetsConst.heveaBlackLogo),
              );
            }));
  }
}
