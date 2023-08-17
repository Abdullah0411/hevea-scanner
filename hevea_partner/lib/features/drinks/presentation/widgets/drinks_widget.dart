import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/drinks/presentation/widgets/drink_card.dart';
import 'package:hevea_partner/features/drinks/providers/drinks_providers.dart';
import 'package:hevea_partner/features/loopy_card/domian/loopy_card.dart';
import 'package:hevea_partner/utils/extensions/general_extensions.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';
import 'package:hevea_partner/widgets/alert_box.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';
import 'package:hevea_partner/widgets/error_alert_dialog.dart';
import 'package:hevea_partner/widgets/selectable_custom_gridview.dart';

class DrinksWidget extends ConsumerStatefulWidget {
  const DrinksWidget({super.key, required this.drinks, required this.card});
  final Map<String, dynamic> drinks;
  final LoopyCard card;

  @override
  ConsumerState<DrinksWidget> createState() => _DrinksWidgetState();
}

class _DrinksWidgetState extends ConsumerState<DrinksWidget> {
  int? _selectedIndex;

  Map<String, dynamic>? selectedDrink;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    selectedDrink = widget.drinks.filterByKey(
      (key) => key.contains(widget.drinks.keys.toList()[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        ref.watch(DrinksProviders.drinksScreenControllerProvider);
    controller.context = context;
    ref.listen(
      DrinksProviders.stampsProvider,
      (previous, next) {
        if (!next.isStamped) {
          controller.attempts--;
          AlertDialogBox.showBoxDialog(
            child: ErrorAlertDialog(
              title: 'Error',
              errorMessage: next.message.safe('Something went wrong'),
              onPressed: controller.popAlert,
            ),
          );
        }
      },
    );
    final drinks = widget.drinks.keysToList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpacingConst.vSpacing20,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Choose Drink !',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 32.sp),
          ),
        ),
        SpacingConst.hSpacing32,
        SelectableCustomGridView(
          items: drinks.listToWidgets(
            (drink) => DrinkCard(
              name: drink,
              isSelected: _selectedIndex == drinks.indexOf(drink),
            ),
          ),
          maxItemsPerRow: 2,
          onItemSelected: _onItemSelected,
        ),
        SpacingConst.vSpacing40,
        CustomButton(
          onPressed: () async {
            if (selectedDrink != null && controller.attempts < 1) {
              await ref
                  .read(DrinksProviders.drinksScreenControllerProvider)
                  .onSubmit(selectedDrink.safe({}), widget.card.id);
              controller.attempts++;
            }
          },
          label: 'SUBMIT',
          size: ButtonSize.large,
          style: CustomButtonStyle.primary,
        )
      ],
    );
  }
}
