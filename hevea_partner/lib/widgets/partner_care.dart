import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/widgets/custom_assets_image.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersCare extends StatelessWidget {
  const PartnersCare({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(
          Uri.parse(
              'https://api.whatsapp.com/send/?phone=550851983&text&type=phone_number&app_absent=0'),
          mode: LaunchMode.externalApplication,
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraintsCone.cardTabletConstraint,
        child: Container(
          height: 75.h,
          width: 270.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [ShadowConst.lightGreyShadow],
          ),
          padding: EdgeInsets.all(SpacingConst.spacing8.toDouble()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 75,
                  maxHeight: 75,
                ),
                child: CustomAssetsImage(
                    name: AssetsConst.heveaBlackLogo, size: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Partners Care',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Have a Problem?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 65,
                  maxHeight: 65,
                ),
                child: Container(
                  height: 42.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                      color: AppColors.infoBlue,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 35.w,
                          height: 30.h,
                          child: SvgPicture.asset(AssetsConst.message),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 25.w,
                          height: 20.h,
                          child: SvgPicture.asset(AssetsConst.phone),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
