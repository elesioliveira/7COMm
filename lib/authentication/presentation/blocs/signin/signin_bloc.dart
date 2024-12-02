// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/utils/show_toast.dart';
import '../../../data/remote/repositories/signin_repository.dart';
import 'signin_state.dart';

class SigninBloc extends Cubit<SigninSate> {
  final SigninRepository datasourceImpl;
  String userBloc = '';
  String passwordBloc = '';
  SigninBloc({required this.datasourceImpl}) : super(SigninInitial());

  Future<void> signinUser(
      {required String user,
      required String password,
      required String otp,
      required BuildContext context}) async {
    emit(SigninLoading());
    userBloc = user;
    passwordBloc = password;
    final result = await datasourceImpl.signinUser(
        user: user, password: password, otp: otp);
    if (result.success != null) {
      navigateToPage(context, '/home');
    } else if (result.error == 'Invalid credentials') {
      showToast(message: result.error!, isError: true);
    } else {
      showToast(message: result.error!, isError: true);
      navigateToPage(context, '/secretPage');
    }
    emit(SigninInitial());
  }
}
