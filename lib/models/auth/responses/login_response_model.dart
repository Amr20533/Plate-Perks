class LoginResponseModel {
  String refresh;
  String access;

  LoginResponseModel({
    required this.refresh,
    required this.access,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }
}
