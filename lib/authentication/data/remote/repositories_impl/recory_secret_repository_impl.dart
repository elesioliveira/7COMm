import '../../../../core/models/secret_code_model.dart';
import '../../../../core/shared/result.dart';
import '../../datasources/recory_secret_datasource.dart';
import '../repositories/recory_secret_repository.dart';

class RecorySecretRepositoryImpl implements RecorySecretRepository {
  final RecorySecretDatasource datasource;

  const RecorySecretRepositoryImpl({required this.datasource});

  @override
  Future<Result<SecretCodeModel>> recorySecretToken(
      {required String user,
      required String password,
      required String code}) async {
    return await datasource.getSecretToken(
        user: user, password: password, code: code);
  }
}
