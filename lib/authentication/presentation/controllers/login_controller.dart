import 'package:flutter/material.dart';

import '../blocs/recory_secret/recory_secret_bloc.dart';
import '../blocs/signin/signin_bloc.dart';

class LoginController extends ChangeNotifier {
  final SigninBloc signinBloc;
  final RecorySecretBloc recorySecretBloc;

  LoginController({required this.signinBloc, required this.recorySecretBloc});

  submitAuthentication(BuildContext context,
      {required String user, required String password}) async {
    final totp = recorySecretBloc.generateTOTP(recorySecretBloc.secretCode);
    await signinBloc.signinUser(
        user: user, password: password, otp: totp, context: context);
  }
}
