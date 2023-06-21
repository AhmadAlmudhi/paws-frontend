import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../widgets/general_widgets/image_upload.dart';

Future<Response> createPost(Map data) async {
  List imagesLinks = [];

  for (var file in pickedImages) {
    final Response link = await getImageUrl(file);
    if (link.statusCode == 200) {
      imagesLinks.add(jsonDecode(link.body)["url"]);
    }
  }
  pickedImages.clear();

  data.addAll({"images": imagesLinks});

  Uri uri = Uri.parse("http://0.0.0.0:8080/post/create");
  Response response = await post(uri,
      body: jsonEncode(data),
      headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> getImageUrl(File file) async {
  final bytes = await file.readAsBytes();

  Uri uri = Uri.parse("http://0.0.0.0:8080/post/get_image_url");
  Response response = await post(uri,
      body: bytes, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> readAllPosts() async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/post/read_all");
  Response response =
      await get(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> readPost(int id) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/post/read/$id");
  Response response =
      await get(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> deletePost(int id) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/post/delete/$id");
  Response response =
      await delete(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}

Future<Response> toggleFavorite(int id) async {
  Uri uri = Uri.parse("http://0.0.0.0:8080/post/toggle_favorite/$id");
  Response response =
      await post(uri, headers: {"authorization": GetStorage().read("token")});

  return response;
}
