// ignore_for_file: public_member_api_docs, sort_constructors_first
class SecretCodeModel {
  final String? message;
  final String? totpSecret;

  SecretCodeModel({
    required this.message,
    required this.totpSecret,
  });

  factory SecretCodeModel.fromJson(Map<String, dynamic> json) {
    return SecretCodeModel(
      message: json['message'],
      totpSecret: json['totp_secret'],
    );
  }

  @override
  String toString() =>
      'SecretCodeModel(message: $message, totpSecret: $totpSecret)';
}
