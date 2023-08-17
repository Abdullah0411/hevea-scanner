import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';

class SelectableCustomGridView extends StatefulWidget {
  /// Creates a selectable custom grid view
  /// [items] is the list of items to display
  /// [maxItemsPerRow] is the maximum number of items per row
  /// [onItemSelected] is the callback when an item is selected

  const SelectableCustomGridView({
    super.key,
    required this.items,
    required this.maxItemsPerRow,
    required this.onItemSelected,
  });

  final List<Widget> items;
  final Function(int) onItemSelected;

  final int maxItemsPerRow;

  @override
  State<SelectableCustomGridView> createState() =>
      _SelectableCustomGridViewState();
}

class _SelectableCustomGridViewState extends State<SelectableCustomGridView> {
  @override
  Widget build(BuildContext context) {
    // Calculate the number of rows needed
    int numRows = (widget.items.length / widget.maxItemsPerRow).ceil();

    return Column(
      children: List.generate(numRows, (rowIndex) {
        int start = rowIndex * widget.maxItemsPerRow;
        int end = start + widget.maxItemsPerRow < widget.items.length
            ? start + widget.maxItemsPerRow
            : widget.items.length;

        List<Widget> rowItems = widget.items.sublist(start, end);

        return Padding(
          padding:
              EdgeInsets.symmetric(vertical: SpacingConst.spacing16.toDouble()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowItems.listToWidgets(
              (item) => GestureDetector(
                onTap: () {
                  widget.onItemSelected(widget.items.indexOf(item));
                },
                child: item,
              ),
            ),
          ),
        );
      }),
    );
  }
}
