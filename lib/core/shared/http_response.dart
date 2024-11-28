class HttpResponseModel<T> {
  HttpResponseModel({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
  final T? data;
  final int? statusCode;
  final String? statusMessage;

  @override
  String toString() =>
      'HttpResponse(data: $data, statusCode: $statusCode, statusMessage: $statusMessage)';
}
