import '../../../../core/models/secret_code_model.dart';
import '../../../../core/shared/result.dart';

abstract class RecorySecretDatasource {
  Future<Result<SecretCodeModel>> recorySecretToken(
      {required String user, required String password, required String code});
}
