import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:paws_frontend/screens/post_details_screen.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.name,
    required this.type,
    required this.breed,
    required this.age,
    required this.favoritesNumber,
    required this.imagesLinks,
    required this.color,
    required this.id,
  });

  final String name, type, breed, color;
  final int age, favoritesNumber, id;
  final List imagesLinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailsScreen(
                      id: id,
                    )),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Stack(
              children: [
                ImageSlideshow(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  indicatorColor: Colors.white,
                  isLoop: true,
                  children: [
                    for (String imageLink in imagesLinks)
                      Image.network(
                        imageLink,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: const Color.fromARGB(150, 0, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "$name | ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "$age years",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$type | $breed | $color",
                                style: const TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 8),
                                    child: Text(
                                      "$favoritesNumber",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
