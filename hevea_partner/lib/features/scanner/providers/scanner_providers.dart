import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/scanner/presentation/controller/scanner_controller.dart';

class ScannerProviders {
  static final scannerControllerProvider = StateProvider.autoDispose((ref) {
    return ScannerController(ref: ref);
  });
}
