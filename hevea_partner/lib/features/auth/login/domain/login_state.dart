import 'package:hevea_partner/utils/extensions/general_extensions.dart';

class LoginState {
  LoginState({required this.isLoggedIn, this.errorMessage});
  final bool isLoggedIn;
  final String? errorMessage;

  LoginState copyWith({required bool isLoggedIn, String? errorMessage}) {
    return LoginState(
      isLoggedIn: isLoggedIn,
      errorMessage: errorMessage.safe(''),
    );
  }
}
