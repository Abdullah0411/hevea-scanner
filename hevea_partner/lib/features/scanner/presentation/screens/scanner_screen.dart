import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_core/widgets/conditionary_widget/conditionary_widget.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_partner/features/loopy_card/providers/card_providers.dart';
import 'package:hevea_partner/features/scanner/presentation/widgets/customer_card.dart';
import 'package:hevea_partner/features/scanner/presentation/widgets/scan_border.dart';
import 'package:hevea_partner/features/scanner/providers/scanner_providers.dart';
import 'package:hevea_partner/features/base/providers/base_screen_providers.dart';
import 'package:hevea_partner/widgets/custom_back_button.dart';

class ScannerScreen extends ConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ScannerProviders.scannerControllerProvider);
    controller.context = context;
    final card = ref.watch(CardProviders.cardProvider);
    return Sheet(
      child: Stack(
        children: [
          MobileScanner(
            fit: BoxFit.cover,
            controller: controller.scannerController,
            onDetect: (capture) {
              EasyDebounce.debounce(
                'scanner',
                const Duration(milliseconds: 150),
                () {
                  controller.onDetect(capture);
                },
              );
            },
          ),
          const BorderFrameOverlay(
            cornerRadius: 60,
            borderColor: AppColors.white,
          ),
          Positioned(
            top: 55.h,
            left: 25.w,
            child: CustomBackButton(
              onPressed: () {
                ref
                    .read(BaseScreenProviders.currentPageIndexProvider.notifier)
                    .update((state) => 0);

                controller.scannerController.stop();
              },
            ).animate().slide(
                  duration: 200.ms,
                  curve: Curves.easeInOut,
                  begin: const Offset(-1, -0.75),
                ),
          ),
          ConditionaryWidget(
            condition: card != null,
            trueWidget: Positioned(
              bottom: 75.h,
              left: 65.w,
              child: Center(
                child: CustomerCard(
                  onPressed: () {
                    ref
                        .read(ScannerProviders.scannerControllerProvider)
                        .onCustomerCardPress(card!);
                  },
                  customerDetails: card?.customerDetails,
                ).animate().slideY(
                      begin: 1,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
