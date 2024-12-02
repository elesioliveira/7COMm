// ignore_for_file: avoid_print

import 'package:flutter_dev_test/core/shared/result.dart';
import '../../../../core/models/auth_response.model.dart';
import '../../datasources/signin_repository_datasource.dart';
import '../repositories/signin_repository.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SigninRepositoryDatasource datasource;

  const SigninRepositoryImpl({required this.datasource});

  @override
  Future<Result<AuthResponseModel>> signinUser({
    required String user,
    required String password,
    required String otp,
  }) async {
    return await datasource.getUser(user: user, password: password, otp: otp);
  }
}
