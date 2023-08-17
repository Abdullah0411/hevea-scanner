import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/features/partner_scan/domain/partner_scan.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/hevea_details.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/info_widget.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/invoice_info.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/titles_row.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/total_vat_amount.dart';
import 'package:hevea_partner/features/pdf/presentation/pdf_widgets/total_widget.dart';
import 'package:hevea_partner/features/transaction_history/domain/transaction_history.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TransactionPage {
  static Future<Uint8List> _loadImageAsset(String path) async {
    final ByteData imageData = await rootBundle.load(path);
    return imageData.buffer.asUint8List();
  }

  static Future<pw.Page> createPage({
    required List<PartnerScan> list,
    required TransactionHistory transactionHistory,
    required DateTime date,
  }) async {
    Map<String, int> keyCount = {};
    Map<String, double> valueSum = {};
    Map<String, int> keyValues = {};

    for (final partnerScan in list) {
      for (final key in partnerScan.drink.keys) {
        keyCount[key] = keyCount[key].safe(0) + 1;
        valueSum[key] = valueSum[key].safe(0) + partnerScan.drink[key];

        if (keyValues[key] == null) {
          keyValues[key] = partnerScan.drink[key];
        }
      }
    }

    final imageBytes = await _loadImageAsset(AssetsConst.heveaTextLogo);
    final imageProvider = pw.MemoryImage(imageBytes);

    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Image(imageProvider, width: 150, height: 150),
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                InfoWidget(
                  title: 'CAFFEESHOP DETAILS:',
                  information: [
                    'Name: ${transactionHistory.partnerName}',
                    'Email: ${transactionHistory.partnerName}',
                    'IBAN: ${transactionHistory.partnerIban}',
                  ],
                ),
                pw.Text(
                  'Date: ${date.year}-${date.month}',
                )
              ],
            ),
            pw.SizedBox(height: 5),
            TitlesRow(),
            pw.SizedBox(height: 3),
            ...List.generate(
              keyCount.length,
              (index) => InvoiceInfo(
                productName: keyCount.keys.elementAt(index),
                quantity: '${keyCount.values.elementAt(index)}',
                price: '${keyValues.values.elementAt(index)}',
                total:
                    '${valueSum.values.elementAt(index)} ${transactionHistory.currency}',
              ),
            ),
            TotalWidget(
              total:
                  '${transactionHistory.partnerScans.fold<double>(0, (previousValue, partnerScan) => previousValue + partnerScan.drink.values.first)} ${transactionHistory.currency}',
            ),
            pw.SizedBox(height: 5),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: TotalAmount(
                total: transactionHistory.partnerScans.fold<double>(
                  0,
                  (previousValue, partnerScan) =>
                      previousValue + partnerScan.drink.values.first,
                ),
              ),
            ),
            HeveaDetails(),
            pw.SizedBox(height: 2),
            pw.Center(
              child: pw.Text('INVOICE NO: #${transactionHistory.id}',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
            )
          ],
        );
      },
    );
  }
}
