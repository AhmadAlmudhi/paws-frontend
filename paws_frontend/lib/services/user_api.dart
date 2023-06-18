import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

Future<Response> getUser(int id) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/get_user");
  Response response =
      await get(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> updateProfile(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/update_profile");
  Response response = await put(uri,
      body: jsonEncode(data),
      headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> updateProfileImage(Map data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/update_image");
  Response response = await put(uri,
      body: jsonEncode(data),
      headers: {"authorization": GetStorage().read("token")});

  return response;
}