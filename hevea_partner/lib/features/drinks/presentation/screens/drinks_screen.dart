import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/drinks/presentation/widgets/drinks_widget.dart';
import 'package:hevea_partner/features/drinks/presentation/widgets/loading_drinks_widget.dart';
import 'package:hevea_partner/features/drinks/providers/drinks_providers.dart';
import 'package:hevea_partner/features/loopy_card/domian/loopy_card.dart';

class DrinksScreen extends ConsumerWidget {
  const DrinksScreen({super.key, required this.card});
  final LoopyCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drinks = ref.watch(DrinksProviders.drinksProvider);

    return Sheet(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SpacingConst.spacing20.toDouble()),
        child: drinks.maybeWhen(
          data: (drinks) => DrinksWidget(drinks: drinks, card: card),
          orElse: () =>
              const LoadingDrinksWidget(), //TODO: add error widget here
          loading: () => const LoadingDrinksWidget(),
        ),
      ),
    );
  }
}
