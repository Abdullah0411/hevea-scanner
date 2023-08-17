import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/features/base/providers/base_screen_providers.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> bottomBarAnimationControllers;

  @override
  void initState() {
    super.initState();

    bottomBarAnimationControllers = List.generate(
        ref.read(BaseScreenProviders.pagesProvider).length, (index) {
      return AnimationController(
        upperBound: 1,
        lowerBound: 0.95,
        value: 1,
        vsync: this,
        duration: const Duration(milliseconds: 100),
      );
    });
  }

  @override
  void dispose() {
    for (final controller in bottomBarAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void changePageIndex(int newIndex) {
    setState(() {
      ref
          .read(BaseScreenProviders.currentPageIndexProvider.notifier)
          .update((state) => newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sheet(
      scroll: false,
      bottomSheet: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            AnimatedPositioned(
              bottom:
                  ref.watch(BaseScreenProviders.currentPageIndexProvider) != 1
                      ? 0.h
                      : -100.h,
              duration: 200.ms,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [ShadowConst.blackShadow],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    ref.watch(BaseScreenProviders.pagesProvider).length,
                    (index) => GestureDetector(
                      onTap: (() async {
                        bottomBarAnimationControllers[index].forward().then(
                          (_) {
                            bottomBarAnimationControllers[index].reverse();
                          },
                        );
                        changePageIndex(index);
                      }),
                      child: ScaleTransition(
                        scale: bottomBarAnimationControllers[index],
                        child: AnimatedContainer(
                          width: 47.w,
                          height: 47.h,
                          duration: 150.ms,
                          decoration: BoxDecoration(
                            color: ref.watch(BaseScreenProviders
                                        .currentPageIndexProvider) ==
                                    index
                                ? ref.watch(BaseScreenProviders
                                    .boxColorsProvider)[index]
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          child: Icon(
                            ref.watch(BaseScreenProviders.iconsProvider)[index],
                            color: ref.watch(BaseScreenProviders
                                        .currentPageIndexProvider) ==
                                    index
                                ? ref.watch(BaseScreenProviders
                                    .iconColorsProvider)[index]
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      child: ref.watch(BaseScreenProviders.pagesProvider)[
          ref.watch(BaseScreenProviders.currentPageIndexProvider)],
    );
  }
}
