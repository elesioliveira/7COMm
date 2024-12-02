// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/constants/app_urls.dart';
import '../../../core/models/auth_response.model.dart';
import '../../../core/shared/http_exception_model.dart';
import '../../../core/shared/http_manager.dart';
import '../../../core/shared/result.dart';

class SigninRepositoryDatasource {
  final HttpManager httpManager;
  SigninRepositoryDatasource({required this.httpManager});

  Future<Result<AuthResponseModel>> getUser({
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
