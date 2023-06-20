import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

Future<Response> getUser(int id) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/get_user/$id");
  Response response =
      await get(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> getMyInfo() async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/get_my_info");
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

Future<Response> updateProfileImage(File data) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/user/update_image");
  Response response = await put(uri,
      body: jsonEncode(data),
      headers: {"authorization": GetStorage().read("token")});

  return response;
}
