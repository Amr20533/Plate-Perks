class LoginModel {
  String username;

  LoginModel({
    required this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
    };
  }
}
