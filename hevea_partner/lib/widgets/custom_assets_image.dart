import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAssetsImage extends StatelessWidget {
  CustomAssetsImage({super.key, required this.name, this.size});
  final String name;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      width: size?.w,
      height: size?.h,
      fit: BoxFit.cover,
    );
  }
}
