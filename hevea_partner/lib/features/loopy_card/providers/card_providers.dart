import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hevea_core/utilis/logger/extensions.dart';
import 'package:hevea_partner/features/auth/session/providers/session_providers.dart';
import 'package:hevea_partner/features/loopy_card/domian/loopy_card.dart';
import 'package:hevea_partner/features/loopy_card/repo/card_repo.dart';

class CardProviders {
  static final cardProvider =
      StateProvider.autoDispose<LoopyCard?>((ref) => null);
}
