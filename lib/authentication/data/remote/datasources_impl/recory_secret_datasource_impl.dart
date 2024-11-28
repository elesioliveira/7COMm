import 'package:flutter_dev_test/authentication/data/remote/datasources/recory_secret_datasource.dart';
import 'package:flutter_dev_test/core/shared/http_manager.dart';
import 'package:flutter_dev_test/core/shared/result.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/models/secret_code_model.dart';
import '../../../../core/shared/http_exception_model.dart';

class RecorySecretDatasourceImpl implements RecorySecretDatasource {
  final HttpManager httpManager;

  const RecorySecretDatasourceImpl({required this.httpManager});

  @override
  Future<Result<SecretCodeModel>> recorySecretToken(
      {required String user,
      required String password,
      required String code}) async {
    try {
      final response = await httpManager.restRequest(
          url: '${EndPoints.base}/auth/recovery-secret',
          method: HttpMethods.post,
          body: {"username": user, "password": password, "code": code});
      final secretCode = SecretCodeModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Result(success: secretCode, error: null);
      }

      return Result(success: null, error: secretCode.message);
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
