// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/constants/app_urls.dart';
import '../../../core/models/secret_code_model.dart';
import '../../../core/shared/http_exception_model.dart';
import '../../../core/shared/http_manager.dart';
import '../../../core/shared/result.dart';

class RecorySecretDatasource {
  final HttpManager httpManager;
  RecorySecretDatasource({required this.httpManager});

  Future<Result<SecretCodeModel>> getSecretToken(
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
