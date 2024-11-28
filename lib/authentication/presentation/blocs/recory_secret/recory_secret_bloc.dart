// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/authentication/presentation/blocs/recory_secret/recory_secret_state.dart';
import 'package:flutter_dev_test/core/utils/app_navigation.dart';
import 'package:flutter_dev_test/core/utils/show_toast.dart';
import 'package:otp/otp.dart';
import '../../../data/remote/datasources/recory_secret_datasource.dart';

class RecorySecretBloc extends Cubit<RecorySecretState> {
  final RecorySecretDatasource recoryDataSource;
  String secretCode = '';

  RecorySecretBloc({required this.recoryDataSource})
      : super(RecorySecretStateInitial());

  Future<void> recorySecret(
      {required String user,
      required String password,
      required String code,
      required BuildContext context}) async {
    emit(RecorySecretStateLoading());
    final result = await recoryDataSource.recorySecretToken(
        user: user, password: password, code: code);
    if (result.success != null) {
      secretCode = result.success!.totpSecret!;
      print(secretCode);
      navigateToPage(context, '/');
    } else {
      showToast(message: result.error!, isError: true);
    }
    emit(RecorySecretStateInitial());
  }

  String generateTOTP(String secret) {
    return OTP.generateTOTPCodeString(
      secret,
      DateTime.now().millisecondsSinceEpoch,
      interval: 30,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }
}
