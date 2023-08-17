import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/transaction_history/presentation/widgets/generating_pdf_widget.dart';
import 'package:hevea_partner/features/transaction_history/presentation/widgets/month_data_widget.dart';
import 'package:hevea_partner/features/transaction_history/providers/transaction_history_providers.dart';
import 'package:hevea_partner/utils/extensions/iterable_extensions.dart';
import 'package:hevea_partner/widgets/alert_box.dart';
import 'package:hevea_partner/widgets/custom_back_button.dart';

class TransactionHistoryScreen extends ConsumerWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
        TransactionHistoryProviders.transactionHistoryScreenControllerProvider);
    controller.context = context;

    final previousMonth = controller.now - 1;

    final List<String> monthsToShow = [];
    for (int i = 0; i < previousMonth; i++) {
      monthsToShow.add(
        controller.months[i],
      );
    }
    return Sheet(
      scroll: monthsToShow.isNotEmpty,
      appBar: AppBar(
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerRight,
          child: CustomBackButton(
            backgroundColor: AppColors.lightGrey.withOpacity(0.1),
            onPressed: controller.pop,
          ),
        ),
        title: Text(
          'History',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 30.sp),
        ),
      ),
      children: monthsToShow.isEmpty
          ? [
              SpacingConst.vSpacing20,
              Text(
                'No transaction history',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 17.sp, fontFamily: 'Cario'),
              ),
            ]
          : [
              SpacingConst.vSpacing20,
              ...monthsToShow.listToWidgets(
                (month) => MonthData(
                  showLine: monthsToShow.indexOf(month) < previousMonth - 1,
                  label: month,
                  onPressed: () async {
                    final isEmpty = await controller.scansIsEmpty(month);
                    AlertDialogBox.showBoxDialog(
                      child: GenratingPdfWidget(
                          month: month,
                          onPressed: controller.pop,
                          description: isEmpty
                              ? 'No transactions for $month'
                              : 'Your invoice is being generated'),
                    );
                    if (!isEmpty) await controller.downloadMonthData(month);
                  },
                ),
              ),
            ],
    );
  }
}
