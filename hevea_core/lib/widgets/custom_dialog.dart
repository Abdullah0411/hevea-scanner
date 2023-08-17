import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final List<Widget> content;

  get smallSeparation => null;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ] +
            content,
      ),
    );
  }

  Future<void> showCustomDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        content: content,
      ),
    );
  }
}
