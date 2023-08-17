import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/success_screen/presentation/controllers/success_screen_controller.dart';

class SuccessProviders {
  static final successScreenControllerProvider =
      StateProvider((ref) => SuccessController(ref: ref));
}
