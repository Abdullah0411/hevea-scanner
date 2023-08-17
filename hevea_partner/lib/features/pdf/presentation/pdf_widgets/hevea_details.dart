import 'package:pdf/widgets.dart' as pw;

class HeveaDetails extends pw.StatelessWidget {
  HeveaDetails();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Company BANK DETAILS',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          'Al-Riyadh Bank',
          style: const pw.TextStyle(fontSize: 12),
        ),
        pw.Row(
          children: [
            pw.Text(
              'Account Name:',
              style: const pw.TextStyle(fontSize: 12),
            ),
            pw.Text('Company name',
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
                textDirection: pw.TextDirection.rtl),
          ],
        ),
      ],
    );
  }
}
