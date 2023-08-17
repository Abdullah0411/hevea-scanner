import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/constants/constants.dart';
import 'package:hevea_core/widgets/loading_container.dart';

class LoadingRoundedCard extends StatelessWidget {
  const LoadingRoundedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 162,
        maxHeight: 35,
      ),
      child: LoadingContainer(
        borderRadius: largeBorderRadius,
        width: 162.w,
        height: 35.h,
      ),
    );
  }
}
