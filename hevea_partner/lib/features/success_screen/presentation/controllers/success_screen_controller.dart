import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_partner/features/base/providers/base_screen_providers.dart';

class SuccessController {
  SuccessController({required this.ref});

  Ref ref;
  late BuildContext context;

  void onHomeButtonPressed() {
    ref.refresh(BaseScreenProviders.currentPageIndexProvider);
    EasyNavigator.popToFirstView(context);
  }
}
