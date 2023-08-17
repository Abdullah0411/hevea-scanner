import 'package:pdf/widgets.dart' as pw;

class InfoWidget extends pw.StatelessWidget {
  InfoWidget({this.title, required this.information});
  String? title;
  final List<String> information;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        (title != null)
            ? pw.Text(
                title!,
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              )
            : pw.SizedBox.shrink(),
        ...List.generate(
          information.length,
          (index) => pw.Text(information[index]),
        )
      ],
    );
  }
}
