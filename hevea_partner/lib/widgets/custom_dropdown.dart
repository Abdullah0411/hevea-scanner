import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_partner/constants/icons/hevea_icons.dart';
import 'package:hevea_partner/theme/extensions.dart';
import 'package:hevea_core/widgets/bottom_sheet/bottom_sheet_navigator.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.text,
    required this.values,
    required this.onChange,
  }) : super(key: key);

  final String text;
  final List<CustomChoice<T>> values;
  final Function(T) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final returnedValue = await showCustomBottomSheet<T>(
            context: context,
            isFullBottomSheet: false,
            child: ChoicesWidget(
              choices: values,
            ));

        if (returnedValue != null) {
          onChange(returnedValue);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
        height: 38.h,
        width: 288.w,
        decoration: BoxDecoration(
            color: AppColors.cultured,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(children: [
          Text(text,
              style: context.textThemes.bodySmall
                  ?.copyWith(color: AppColors.primary)),
          const Spacer(),
          const Icon(
            HeveaIcons.arrowDown,
            color: AppColors.darkGrey,
          )
        ]),
      ),
    );
  }
}

class ChoicesWidget<T> extends StatelessWidget {
  const ChoicesWidget({
    required this.choices,
    Key? key,
  }) : super(key: key);

  final List<CustomChoice<T>> choices;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14.sp)),
      width: 336.w,
      child: SingleChildScrollView(child: Column(children: choices)),
    );
  }
}

class CustomChoice<T> extends StatefulWidget {
  const CustomChoice({
    Key? key,
    required this.value,
    required this.text,
  }) : super(key: key);

  final T value;
  final String text;

  @override
  State<CustomChoice<T>> createState() => _CustomChoiceState<T>();
}

class _CustomChoiceState<T> extends State<CustomChoice<T>> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        HapticFeedback.mediumImpact();
        setState(() {
          _isClicked = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));
        Navigator.of(context).pop(widget.value);
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
        height: 38.h,
        width: 288.w,
        decoration: BoxDecoration(
            color: _isClicked ? AppColors.primary : AppColors.cultured,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Text(widget.text,
            style: context.textThemes.bodySmall
                ?.copyWith(color: AppColors.primary)),
      ),
    );
  }
}
