import 'http_response.dart';

class HttpExceptionModel {
  HttpExceptionModel({
    this.message,
    this.statusCode,
    required this.error,
    this.response,
  });
  final int? statusCode;
  final String? message;
  final dynamic error;
  final HttpResponseModel? response;

  @override
  String toString() {
    return 'HttpException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
