import 'package:hevea_partner/features/hevea_partner/domain/hevea_partner.dart';

class SessionState {
  final bool isLoggedIn;
  final HeveaPartner heveaPartner;

  SessionState({required this.isLoggedIn, required this.heveaPartner});

  SessionState copyWith({
    bool? isLoggedIn,
    HeveaPartner? heveaPartner,
  }) {
    return SessionState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      heveaPartner: heveaPartner ?? this.heveaPartner,
    );
  }
}
