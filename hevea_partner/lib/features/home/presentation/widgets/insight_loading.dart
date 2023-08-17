import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/widgets/loading_container.dart';

class InsightLoading extends StatelessWidget {
  const InsightLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 250,
        maxHeight: 250,
      ),
      child: LoadingContainer(
        height: 165.h,
        width: 158.w,
      ),
    );
  }
}
