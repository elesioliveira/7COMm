// ignore_for_file: public_member_api_docs, sort_constructors_first
class Result<T> {
  final T? success;
  final String? error;

  Result({this.success, this.error});

  @override
  String toString() => 'Result(success: $success, error: $error)';
}
