import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/screens/Nav_screens/profile_screen.dart';

import '../services/post_api.dart';
import '../widgets/animal_info/info_column.dart';
import '../widgets/animal_info/options_row.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("Post Details"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        18,
                        18,
                        0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child: const OptionsRow(
                                  text: 'Edit post',
                                  icon: Icons.edit_outlined)),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                              onTap: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Delete post'),
                                      content: const Text(
                                          'Are you sure you wants to delete this post?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Delete'),
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              child: const OptionsRow(
                                text: 'Delete',
                                icon: Icons.delete_forever_outlined,
                                isDelet: true,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<Response>(
          future: readPost(widget.id),
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
                    var userInfo =
                        jsonDecode(snapshot.data!.body)["user_info"][0];
                    var postInfo =
                        jsonDecode(snapshot.data!.body)["post_info"][0];
                    var animalInfo =
                        jsonDecode(snapshot.data!.body)["animal_info"][0];

                    var date = DateTime.parse(postInfo["time"]);
                    String dateString =
                        "${date.day}/${date.month}/${date.year}";

                    return ListView(
                      children: [
                        ImageSlideshow(
                          height: MediaQuery.of(context).size.height * 0.4,
                          children: [
                            for (String image in postInfo["images"])
                              Image.network(image, fit: BoxFit.cover),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileScreen(
                                        id: userInfo["user_id"],
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 27,
                                      backgroundImage:
                                          NetworkImage(userInfo["image"]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userInfo["name"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "@${userInfo["username"]}",
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 95, 94, 94),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 14, 32, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                postInfo["content"],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 94, 94),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      dateString,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 95, 94, 94),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          toggleFavorite(widget.id);
                                          isFav = !isFav;
                                          setState(() {});
                                        },
                                        child: !isFav
                                            ? const Icon(
                                                Icons.favorite_border,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, right: 8),
                                        child: Text(
                                          "${postInfo["favorites_number"]}",
                                        ),
                                      ),
                                      const Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
                          child: Stack(
                            children: [
                              Container(
                                height: 220,
                                width: 366,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 248, 212, 177),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 18, 24, 0),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        "Pet Card",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InfoColumn(
                                            info1: animalInfo["name"],
                                            info2: animalInfo["type"],
                                            info3: animalInfo["breed"],
                                            info4: animalInfo["color"],
                                            info5:
                                                "${animalInfo["age"]} years"),
                                        InfoColumn(
                                            info1: postInfo["status"],
                                            info2: animalInfo["gender"],
                                            info3: animalInfo["fixed"]
                                                ? "fixed"
                                                : "not fixed",
                                            info4: animalInfo["vaccinated"]
                                                ? "vaccinated"
                                                : "not vaccinated",
                                            info5: animalInfo["microchipped"]
                                                ? "microchipped"
                                                : "not microchipped"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return const Text("Not Found");
                }
            }
          },
        ),
      ),
    );
  }
}
