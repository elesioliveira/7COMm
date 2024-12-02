import 'package:flutter_dev_test/core/models/auth_response.model.dart';

import '../../../../core/shared/result.dart';

abstract class SigninRepository {
  Future<Result<AuthResponseModel>> signinUser(
      {required String user, required String password, required String otp});
}
