import 'package:flutter/material.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/drinks/presentation/widgets/loading_rounded_card.dart';
import 'package:hevea_partner/widgets/custom_gridview.dart';

class LoadingDrinksWidget extends StatelessWidget {
  const LoadingDrinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConst.vSpacing20,
        CustomGridView(
          items: List.generate(
            9,
            (index) => const LoadingRoundedCard(),
          ),
          maxItemsPerRow: 2,
        ),
      ],
    );
  }
}
