import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hevea_partner/environments/services/environment_services.dart';
// import 'package:hevea_core/services/amplitude_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hevea_core/services/auth_services.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';
import 'package:intl/date_symbol_data_local.dart';

class Initializer {
  static Future<bool> initAll() async {
    try {
      await initFirebase();

      // await initAmplitude();

      await initDateFormatter();

      FlutterNativeSplash.remove();

      return true;
    } catch (e) {
      e.logException();
      return false;
    }
  }

  // static Future<void> initAmplitude() async {
  //   try {
  //     await AmplitudeServices.init(
  //         Environment.instance.apiKeys?.amplitude ?? '');
  //   } catch (e) {
  //     e.logException();
  //   }
  // }

  static Future<void> initDateFormatter() async {
    try {
      // TODO : use local
      await initializeDateFormatting('ar_SA');
    } catch (e) {
      e.logException();
      GLogger.error('Failed to init DateFormatting!');
    }
  }

  static Future<void> initFirebase() async {
    try {
      await Firebase.initializeApp(
        options: Environment.instance.firebase?.firebaseOptions,
      );

      GLogger.info(
          "(Initializer/initFirebase) Firebase project [${Firebase.app().options.projectId}] status: initialized ✅");
    } catch (e) {
      e.logException();
      GLogger.error(
          "(Initializer/initFirebase) Firebase project [${Firebase.app().options}] status: failed ❌");

      Firebase.app().delete();

      if (FirebaseAuthServices.instance.currentUser != null) {
        GLogger.error("Will try to sign out the user and try again");
        await FirebaseAuthServices.instance.signOut();
        await initFirebase();
      }
    }
  }
}