import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';

class GenratingPdfWidget extends StatelessWidget {
  const GenratingPdfWidget(
      {Key? key, required this.onPressed, required this.month, required this.description})
      : super(key: key);
  final Function() onPressed;
  final String month;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing6.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 140.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice of $month',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22.sp, color: AppColors.black, fontFamily: 'Cario'),
            ),
            SpacingConst.vSpacing20,
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 17.sp, fontFamily: 'Cario'),
            ),
            SpacingConst.vSpacing20,
            CustomButton(
              label: 'Done',
              onPressed: onPressed,
              size: ButtonSize.large,
              style: CustomButtonStyle.primary,
            ),
          ],
        ),
      ),
    );
  }
}
