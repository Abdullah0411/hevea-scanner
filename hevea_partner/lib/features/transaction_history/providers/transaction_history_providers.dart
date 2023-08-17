import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/pdf/providers/pdf_providers.dart';
import 'package:hevea_partner/features/transaction_history/domain/transaction_history.dart';
import 'package:hevea_partner/features/transaction_history/presentation/controllers/transaction_history_controller.dart';
import 'package:hevea_partner/features/transaction_history/repo/transaction_history_repo.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';

class TransactionHistoryProviders {
  static final transactionHistoryScreenControllerProvider =
      StateProvider<TransactionHistoryController>(
    (ref) {
      final pdfController = ref.read(PdfProviders.pdfControllerProvider);
      return TransactionHistoryController(
          ref: ref, pdfController: pdfController);
    },
  );

  static final transactionsProvider =
      FutureProvider.family.autoDispose<TransactionHistory?, String>(
    (ref, transactionDate) async {
      final partnerName =
          ref.read(SessionProviders.sessionStateProvider)?.heveaPartner.name;
      final transactionHistory = TransactionHistoryRepo.getTransactionHistory(
          partnerName.safe(''), transactionDate);
      return transactionHistory;
    },
  );
}
