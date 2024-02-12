import 'dart:convert';
import 'package:crypto/crypto.dart';

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    var byt = utf8.encode(password);
    var digest = sha256.convert(byt);
    String hashedPassword = digest.toString();

    return {
      'username': email.trim(),
      'password': hashedPassword,
      'grant_type': password,
    };
  }
}
