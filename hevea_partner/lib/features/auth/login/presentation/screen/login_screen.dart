import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hevea_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:hevea_core/widgets/custom_textfield/textfield_types.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/icons/hevea_partner_icons.dart';
import 'package:hevea_partner/constants/spacing_const.dart';
import 'package:hevea_partner/features/auth/login/providers/login_providers.dart';
import 'package:hevea_partner/widgets/alert_box.dart';
import 'package:hevea_partner/widgets/custom_assets_image.dart';
import 'package:hevea_partner/widgets/custom_button/custom_button.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_size.dart';
import 'package:hevea_partner/widgets/custom_button/enums/button_style.dart';
import 'package:hevea_partner/widgets/custom_textfield/custom_textfield.dart';
import 'package:hevea_partner/widgets/error_alert_dialog.dart';
import 'package:hevea_partner/widgets/partner_care.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(LoginProviders.loginScreenControllerProvider);
    controller.context = context;
    ref.listen(
      LoginProviders.loginProvider,
      (previous, next) {
        if (next.isLoggedIn == false && next.errorMessage != null) {
          // TODO: enhcnace alert dialog after finishing design
          AlertDialogBox.showBoxDialog(
            child: ErrorAlertDialog(
              title: 'Error',
              errorMessage: next.errorMessage ?? 'Something went wrong',
              onPressed: controller.popAlert,
            ),
          );
        }
      },
    );
    return Sheet(
      backgroundColor: AppColors.primary,
      children: [
        SpacingConst.vSpacing120,
        CustomAssetsImage(
          name: AssetsConst.heveaWhiteLogo,
          size: 150,
        ),
        SpacingConst.vSpacing80,
        CustomTextField(
          validator: controller.isValidName,
          height: 50.h,
          width: 315.w,
          type: TextFieldType.active,
          controller: controller.nameController,
          placeHolderText: 'User name',
        ),
        SpacingConst.vSpacing16,
        SpacingConst.vSpacing6,
        CustomTextField(
          validator: controller.isValidPassword,
          isPassword: true,
          keyboardType: TextInputType.text,
          icon: HeveaPartnerIcons.visibleEyeIcon,
          height: 50.h,
          width: 315.w,
          type: TextFieldType.active,
          controller: controller.passwordController,
          placeHolderText: 'Enter your password',
        ),
        SpacingConst.vSpacing60,
        CustomButton(
          onPressed: controller.login,
          label: 'Login',
          size: ButtonSize.large,
          style: CustomButtonStyle.thirdly,
        ),
        SpacingConst.vSpacing60,
        const PartnersCare()
            .animate()
            .fadeIn(
              duration: 140.ms,
            )
            .animate(onPlay: (controller) => controller.loop())
            .slideY(begin: 0.1, duration: 1.7.seconds)
            .then()
            .slideY(end: 0.1, duration: 1.7.seconds),
      ],
    );
  }
}
