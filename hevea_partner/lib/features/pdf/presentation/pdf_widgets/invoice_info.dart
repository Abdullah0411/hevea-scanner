import 'package:pdf/widgets.dart' as pw;

class InvoiceInfo extends pw.StatelessWidget {
  InvoiceInfo({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.total,
  });
  final String productName;
  final String quantity;
  final String price;
  final String total;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 5),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 95,
            child: pw.Text(
              productName,
              style: const pw.TextStyle(fontSize: 12, lineSpacing: 0.2),
            ),
          ),
          pw.SizedBox(width: 105),
          pw.Text(
            price,
            style: const pw.TextStyle(fontSize: 12, lineSpacing: 0.2),
          ),
          pw.SizedBox(width: 125),
          pw.Text(
            quantity,
            style: const pw.TextStyle(fontSize: 12, lineSpacing: 0.2),
          ),
          pw.SizedBox(width: 95),
          pw.Text(
            total,
            style: const pw.TextStyle(fontSize: 12, lineSpacing: 0.2),
          ),
        ],
      ),
    );
  }
}
