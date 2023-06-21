import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/screens/auth_screens/login_screen.dart';
import 'package:paws_frontend/screens/update_profile_screen.dart';
import 'package:paws_frontend/services/user_api.dart';
import 'package:paws_frontend/widgets/general_widgets/user_info.dart';

class ProfileBuilder extends StatefulWidget {
  const ProfileBuilder(
      {super.key, required this.userId, required this.favorites});

  final int userId;
  final List favorites;

  @override
  State<ProfileBuilder> createState() => _ProfileBuilderState();
}

class _ProfileBuilderState extends State<ProfileBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: getUser(widget.userId),
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
                final userData = jsonDecode(snapshot.data!.body);
                final info = userData["info"];
                final details = userData["details"];
                final contact = userData["contact"];
                final showEdit = userData["show_edit"];

                final name = info["name"];
                final username = info["username"];
                final image = info["image"];
                final bio = info["bio"];
                final city = details["city"];
                final country = details["country"];
                final gender = details["gender"];
                final age = details["age"];
                final email = contact["email"];
                final whatsapp = contact["whatsapp"];
                final phone = contact["phone"];

                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    leading: !showEdit
                        ? null
                        : IconButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                              GetStorage().erase();
                              setState(() {});
                            },
                            icon: const Icon(Icons.logout),
                          ),
                    title: const Text("Profile"),
                    actions: [
                      Visibility(
                        visible: showEdit,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen(
                                  initName: name,
                                  initBio: bio,
                                  initCountry: country,
                                  initCity: city,
                                  initEmail: email,
                                  initWhatsapp: whatsapp,
                                  initPhone: phone,
                                  initGender: gender,
                                  initAge: age,
                                  initImage: image,
                                ),
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                  body: UserInfo(
                    name: name,
                    username: username,
                    image: image,
                    bio: bio,
                    city: city,
                    country: country,
                    gender: gender,
                    age: age,
                    email: email,
                    whatsapp: whatsapp,
                    phone: phone,
                    userId: widget.userId,
                    favorites: widget.favorites,
                  ),
                );
              }

              return const Text("Not Found");
            }
        }
      },
    );
  }
}
