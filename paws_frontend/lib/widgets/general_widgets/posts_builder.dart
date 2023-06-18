import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/widgets/general_widgets/post.dart';

import '../../services/post_api.dart';

class PostsBuilder extends StatelessWidget {
  const PostsBuilder({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: readAllPosts(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ));
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data?.statusCode == 200) {
                List<Widget> posts = [];
                for (var element in jsonDecode(snapshot.data!.body)["posts"]) {
                  if (element["post_type"] == type) {
                    posts.add(
                      Post(
                        name: element["name"],
                        type: element["type"],
                        breed: element["breed"],
                        color: element["color"],
                        age: element["age"],
                        favoritesNumber: element["favorites_number"],
                        imagesLinks: element["images"],
                      ),
                    );
                  }
                }
                List<Widget> latestPosts = List.from(posts.reversed);

                return Column(
                  children: latestPosts,
                );
              }

              return const Text("Not Found");
            }
        }
      },
    );
  }
}
