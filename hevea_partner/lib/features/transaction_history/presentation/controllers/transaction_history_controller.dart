import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/services/date_util.dart';
import 'package:hevea_core/services/easy_navigator.dart';
import 'package:hevea_core/services/firebase_storage.dart';
import 'package:hevea_core/utilis/uuid.dart';
import 'package:hevea_partner/features/partner_details/providers/partner_details_providers.dart';
import 'package:hevea_partner/features/partner_scan/providers/partner_scan_providers.dart';
import 'package:hevea_partner/features/pdf/controllers/pdf_controller.dart';
import 'package:hevea_partner/features/transaction_history/domain/transaction_history.dart';
import 'package:hevea_partner/features/transaction_history/providers/transaction_history_providers.dart';
import 'package:hevea_partner/features/transaction_history/repo/transaction_history_repo.dart';
import 'package:path_provider/path_provider.dart';

class TransactionHistoryController {
  TransactionHistoryController({
    required this.ref,
    required this.pdfController,
  });

  final Ref ref;
  final PdfController pdfController;
  late BuildContext context;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final int now = DateTime.now().month;

  void pop() {
    EasyNavigator.popPage(context);
  }

  Future<bool> scansIsEmpty(String month) async {
    final date = DateTime(DateTime.now().year, months.indexOf(month) + 1);
    final partnerScans =
        await ref.read(PartnerScanProviders.partnerScanProvider(date).future);
    if (partnerScans.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> downloadMonthData(String month) async {
    final date = DateTime(DateTime.now().year, months.indexOf(month) + 1);
    final outputDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final transactionDate =
        DateUtil.getYearAndMonthAndDayAndTimeString(date, "en");

    final transactionHistory = await ref.read(
      TransactionHistoryProviders.transactionsProvider(transactionDate).future,
    );
    final partnerDetails =
        await ref.read(PartnerDetailsProviders.partnerDetailsProvider.future);

    final partnerScans =
        await ref.read(PartnerScanProviders.partnerScanProvider(date).future);

    if (transactionHistory == null) {
      String id = Uuid.generate;
      bool isExist = await TransactionHistoryRepo.isExist(id);
      while (isExist) {
        id = Uuid.generate;
        isExist = await TransactionHistoryRepo.isExist(id);
      }
      final newTransactionHistory = TransactionHistory(
        id: id,
        partnerName: partnerDetails.partnerName,
        partnerEmail: partnerDetails.email,
        partnerIban: partnerDetails.iban,
        transactionDate: transactionDate,
        partnerScans: partnerScans,
        currency: partnerDetails.currency,
      );
      TransactionHistoryRepo.addTransactionHistory(newTransactionHistory);
      final pdfFile = await pdfController.generatePdf(
        transactionHistory: newTransactionHistory,
        date: date,
        month: month,
        outputDirectory: outputDirectory,
      );

      FirebaseStorageService.uploadFile(
        path:
            '${partnerDetails.partnerName}_invoices/${partnerDetails.partnerName}_${date.year}_$month',
        file: pdfFile,
      );
      await pdfController.openPdfDocument(pdfFile);
    } else {
      final pdfFile = await FirebaseStorageService.downloadFile(
        path:
            '${partnerDetails.partnerName}_invoices/${partnerDetails.partnerName}_${date.year}_$month',
        localPath: '${outputDirectory?.absolute.path}/Hevea_$month.pdf',
      );

      await pdfController.openPdfDocument(pdfFile);
    }
  }
}
