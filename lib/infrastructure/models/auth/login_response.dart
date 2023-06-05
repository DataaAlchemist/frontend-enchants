class LoginResponse {
  LoginResponse({
    required this.code,
    required this.success,
  });

  final int code;
  final bool success;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json['code'],
        success: json['success'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
      };
}
