import 'package:dio/dio.dart';

import 'http_exception_model.dart';
import 'http_response.dart';

class HttpMethods {
  static const String post = 'POST';
  static const String geT = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  Future<HttpResponseModel> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // Headers da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );

      // Retorno do resultado do backend
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw HttpExceptionModel(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
        response: _dioExceptionResponseConverter(e.response),
      );
    }
  }

  HttpResponseModel<T> _dioResponseConverter<T>(Response response) {
    return HttpResponseModel<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  HttpResponseModel? _dioExceptionResponseConverter(Response? response) {
    return HttpResponseModel(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}
