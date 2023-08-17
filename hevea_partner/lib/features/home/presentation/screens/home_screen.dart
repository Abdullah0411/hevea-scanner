import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_partner/constants/app_colors.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/home/presentation/widgets/logout_dialog.dart';
import 'package:hevea_partner/features/home/presentation/widgets/partner_insights_loading.dart';
import 'package:hevea_partner/features/home/presentation/widgets/partner_insights.dart';
import 'package:hevea_partner/features/home/providers/home_providers.dart';
import 'package:hevea_partner/widgets/alert_box.dart';
import 'package:hevea_partner/widgets/partner_care.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(SessionProviders.sessionControllerProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final insights = ref.watch(HomeProviders.homeInsighDataProvider);
    return Sheet(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SpacingConst.spacing20.toDouble()),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingConst.vSpacing60,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello 👋🏻',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      AlertDialogBox.showBoxDialog(
                        child: LogoutDialog(
                          title: 'Logout',
                          message: 'Are you sure you want to logout?',
                          onPressed: ref
                              .watch(HomeProviders.homeScreenControllerProvider)
                              .logout,
                        ),
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      color: AppColors.negativeRed,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '${ref.watch(SessionProviders.sessionStateProvider)?.heveaPartner.name}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w400),
              ),
              SpacingConst.vSpacing16,
              Text(
                'Your insights',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 25.sp),
              ),
              SpacingConst.vSpacing8,
              insights.maybeWhen(
                orElse: () =>
                    const PartnerInsightsLoading(), //TODO: add error widget here
                loading: () => const PartnerInsightsLoading(),
                data: (insights) => PartnerInsights(insights: insights),
              ),
              SpacingConst.vSpacing40,
              const Center(
                child: PartnersCare(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
