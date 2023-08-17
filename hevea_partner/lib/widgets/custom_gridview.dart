import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';

class CustomGridView extends StatelessWidget {
  /// Creates a custom grid view
  /// [items] is the list of items to display
  /// [maxItemsPerRow] is the maximum number of items per row
  const CustomGridView({
    super.key,
    required this.items,
    required this.maxItemsPerRow,
  });
  final List<Widget> items;

  ///[maxItemsPerRow] is the maximum number of items per row
  final int maxItemsPerRow;

  @override
  Widget build(BuildContext context) {
    // Calculate the number of rows needed
    int numRows = (items.length / maxItemsPerRow).ceil();

    return Column(
      children: List.generate(numRows, (rowIndex) {
        int start = rowIndex * maxItemsPerRow;
        int end = start + maxItemsPerRow < items.length
            ? start + maxItemsPerRow
            : items.length;

        List<Widget> rowItems = items.sublist(start, end);

        return Padding(
          padding:
              EdgeInsets.symmetric(vertical: SpacingConst.spacing16.toDouble()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rowItems.listToWidgets((item) => item),
          ),
        );
      }),
    );
  }
}
