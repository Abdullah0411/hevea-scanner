import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/pdf/controllers/pdf_controller.dart';

class PdfProviders {
  static final pdfControllerProvider =
      StateProvider.autoDispose<PdfController>((ref) {
    return PdfController();
  });
}
