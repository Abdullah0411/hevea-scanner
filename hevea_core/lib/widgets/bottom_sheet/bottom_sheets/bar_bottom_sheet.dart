import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/core_colors.dart';
import '../bottom_sheet_route.dart';

const Radius _default_bar_top_radius = Radius.circular(15);

class BarBottomSheet extends StatelessWidget {
  final Widget child;
  final Widget? control;
  final Clip? clipBehavior;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool isFullScreen;
  final SystemUiOverlayStyle? overlayStyle;
  final double? overriddenHeight;

  const BarBottomSheet({
    Key? key,
    required this.child,
    this.control,
    this.isFullScreen = true,
    this.clipBehavior,
    this.shape,
    this.backgroundColor,
    this.elevation,
    this.overlayStyle,
    this.overriddenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: isFullScreen ? overriddenHeight ?? MediaQuery.of(context).size.height : null,
      width: isFullScreen ? MediaQuery.of(context).size.width : null,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle ?? SystemUiOverlayStyle.light,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
          // const SizedBox(height: 12),
          const SafeArea(
            bottom: false,
            child: SizedBox.shrink(),
          ),
          // const SizedBox(height: 8),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Material(
              color: backgroundColor,

              shape: shape ??
                  const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                    borderRadius:
                        BorderRadius.only(topLeft: _default_bar_top_radius, topRight: _default_bar_top_radius),
                  ),
              clipBehavior: clipBehavior ?? Clip.hardEdge,
              // elevation: elevation ?? 2,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: control ??
                              Container(
                                height: 3.h,
                                width: 35.w,
                                decoration:
                                    BoxDecoration(color: CoreColors.darkGrey, borderRadius: BorderRadius.circular(9.r)),
                              ),
                        ),
                        const SizedBox(height: 8),
                        child,
                      ],
                    ),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

Future<T?> showBarModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  double? closeProgressThreshold,
  Clip? clipBehavior,
  Color barrierColor = Colors.black87,
  bool bounce = true,
  bool expand = false,
  AnimationController? secondAnimation,
  Curve? animationCurve,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Widget? topControl,
  Duration? duration,
  RouteSettings? settings,
  SystemUiOverlayStyle? overlayStyle,
}) async {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  final result = await Navigator.of(context, rootNavigator: useRootNavigator).push(DModalBottomSheetRoute<T>(
    builder: builder,
    bounce: bounce,
    closeProgressThreshold: closeProgressThreshold,
    containerBuilder: (_, __, child) => BarBottomSheet(
      child: child,
      control: topControl,
      clipBehavior: clipBehavior,
      shape: shape,
      backgroundColor: backgroundColor,
      elevation: elevation,
      overlayStyle: overlayStyle,
    ),
    secondAnimationController: secondAnimation,
    expanded: expand,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor,
    enableDrag: enableDrag,
    animationCurve: animationCurve,
    duration: duration,
    settings: settings,
  ));
  return result;
}
