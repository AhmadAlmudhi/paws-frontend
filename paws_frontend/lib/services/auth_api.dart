import 'dart:convert';
import 'package:http/http.dart';

Future<Response> signup(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/signup");
  Response response = await post(uri, body: jsonEncode(data));

  return response;
}

Future<Response> login(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/login");
  Response response = await post(uri, body: jsonEncode(data));

  return response;
}

Future<Response> verify(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/verify");
  Response response = await post(uri, body: jsonEncode(data));

  return response;
}

Future<Response> resendCode(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/resend_code");
  Response response = await post(uri, body: jsonEncode(data));

  return response;
}

Future<Response> forgotPassword(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/forgot_password");
  Response response = await post(uri, body: jsonEncode(data));

  return response;
}

Future<Response> updatePassword(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/auth/update_password");
  Response response = await put(uri, body: jsonEncode(data));

  return response;
}
