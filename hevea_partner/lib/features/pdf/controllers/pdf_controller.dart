import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hevea_partner/features/pdf/presentation/pages/transaction_page.dart';
import 'package:hevea_partner/features/transaction_history/domain/transaction_history.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:hevea_core/utilis/logger/g_logger.dart';

class PdfController {
  Future<File> generatePdf({
    required TransactionHistory transactionHistory,
    required String month,
    required DateTime date,
    required Directory? outputDirectory,
  }) async {
    try {
      // Load Custom font
      final pdfTheme = await _loadCustomFont();

      // Create a new PDF document
      final pdf = pw.Document(theme: pdfTheme);

      int totalScans = transactionHistory.partnerScans.length;
      int itemsPerPage = 10;
      int totalPages = (totalScans / itemsPerPage).ceil();

      for (int i = 0; i < totalPages; i++) {
        int startIndex = i * itemsPerPage;
        int endIndex = min(startIndex + itemsPerPage, totalScans);

        final subList =
            transactionHistory.partnerScans.sublist(startIndex, endIndex);

        if (subList.isNotEmpty) {
          pdf.addPage(
            await TransactionPage.createPage(
              list: subList,
              transactionHistory: transactionHistory,
              date: date,
            ),
          );
        }
      }

      final outputFile =
          File('${outputDirectory?.absolute.path}/Hevea_$month.pdf');
      await outputFile.writeAsBytes(await pdf.save());

      return outputFile;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  Future<pw.ThemeData> _loadCustomFont() async {
    final pdfTheme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle
          .load("assets/fonts/IBMPlexArabic/IBMPlexSansArabic-Regular.ttf")),
      bold: pw.Font.ttf(await rootBundle
          .load("assets/fonts/IBMPlexArabic/IBMPlexSansArabic-Bold.ttf")),
    );
    return pdfTheme;
  }

  Future<void> openPdfDocument(File outputFile) async {
    try {
      await OpenFile.open(outputFile.path);
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
