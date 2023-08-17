import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_partner/constants/constants.dart';
import 'package:hevea_partner/constants/icons/hevea_partner_icons.dart';
import 'package:hevea_partner/features/home/presentation/screens/home_screen.dart';
import 'package:hevea_partner/features/scanner/presentation/screens/scanner_screen.dart';

class BaseScreenProviders {
  static final iconsProvider = Provider<List<IconData>>((ref) {
    return [
      HeveaPartnerIcons.home,
      HeveaPartnerIcons.scanner,
    ];
  });

  static final iconColorsProvider = Provider<List<Color>>((ref) {
    return [
      AppColors.darkBlue,
      AppColors.darkPurple,
    ];
  });

  static final boxColorsProvider = Provider<List<Color>>((ref) {
    return [
      AppColors.lightBlue,
      AppColors.lightPurple,
    ];
  });

  static final currentPageIndexProvider = StateProvider<int>((ref) {
    return 0;
  });

  static final pagesProvider = Provider<List<Widget>>((ref) {
    return [
      const HomeScreen(),
      const ScannerScreen(),
    ];
  });
}
