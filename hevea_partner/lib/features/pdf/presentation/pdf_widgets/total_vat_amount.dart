import 'package:pdf/widgets.dart' as pw;

class TotalAmount extends pw.StatelessWidget {
  TotalAmount({required this.total});
  final double total;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text(
              'Total',
              style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              ' $total',
              style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
        //TODO: implement vat later
        // pw.Row(
        //   mainAxisAlignment: pw.MainAxisAlignment.end,
        //   children: [
        //     pw.Text(
        //       'VAT',
        //       style: const pw.TextStyle(fontSize: 13),
        //     ),
        //     pw.Text(
        //       ' ---',
        //       style: const pw.TextStyle(fontSize: 13),
        //     ),
        //   ],
        // ),
        // pw.Row(
        //   mainAxisAlignment: pw.MainAxisAlignment.end,
        //   children: [
        //     pw.Text(
        //       'Amount due',
        //       style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
        //     ),
        //     pw.Text(
        //       ' ---',
        //       style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
