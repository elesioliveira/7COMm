// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthResponseModel {
  final String? message;
  final String? status;

  AuthResponseModel({
    required this.message,
    required this.status,
  });

  // Método para mapear JSON para o modelo
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'],
      status: json['status'],
    );
  }

  @override
  String toString() => 'AuthResponseModel(message: $message, status: $status)';
}
