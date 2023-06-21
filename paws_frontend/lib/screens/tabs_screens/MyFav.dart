import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../services/post_api.dart';
import '../../widgets/general_widgets/post.dart';

class Fav extends StatefulWidget {
  const Fav({super.key, required this.favorites});

  final List favorites;

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: readAllPosts(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Column(
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )),
              ],
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data?.statusCode == 200) {
                List<Widget> posts = [];
                for (var element in jsonDecode(snapshot.data!.body)["posts"]) {
                  for (var postId in widget.favorites) {
                    if (postId == element["post_id"]) {
                      posts.add(
                        Post(
                          name: element["name"],
                          type: element["type"],
                          breed: element["breed"],
                          color: element["color"],
                          age: element["age"],
                          favoritesNumber: element["favorites_number"],
                          imagesLinks: element["images"],
                          id: element["post_id"],
                          update: () {
                            setState(() {});
                          },
                          userFavorites: widget.favorites,
                        ),
                      );
                    }
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
