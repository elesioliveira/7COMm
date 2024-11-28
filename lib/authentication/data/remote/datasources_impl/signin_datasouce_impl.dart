// ignore_for_file: avoid_print

import 'package:flutter_dev_test/core/shared/result.dart';
import 'package:flutter_dev_test/core/shared/http_manager.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/models/auth_response.model.dart';
import '../../../../core/shared/http_exception_model.dart';
import '../datasources/signin_datasource.dart';

class SigninDatasouceImpl implements SigninDatasource {
  final HttpManager httpManager;

  const SigninDatasouceImpl({required this.httpManager});

  @override
  Future<Result<AuthResponseModel>> signinUser({
    required String user,
    required String password,
    required String otp,
  }) async {
    try {
      final response = await httpManager.restRequest(
        url: '${EndPoints.base}/auth/login',
        method: HttpMethods.post,
        body: {
          "username": user,
          "password": password,
          "totp_code": otp,
        },
      );
      final authModel = AuthResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Result(success: authModel, error: null);
      }

      return Result(success: null, error: authModel.message);
    } on HttpExceptionModel catch (e) {
      return Result(
        success: null,
        error: e.response?.data['message'],
      );
    } catch (e) {
      return Result(success: null, error: 'Ocorreu um erro inesperado');
    }
  }
}
