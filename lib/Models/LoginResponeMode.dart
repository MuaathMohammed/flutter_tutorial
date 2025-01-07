class LoginResponseModel {
  final String accessToken;
  final String refreshToken;

  LoginResponseModel({required this.accessToken, required this.refreshToken});

  // Factory constructor to parse the JSON response
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }
}
