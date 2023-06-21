import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/services/user_api.dart';
import '../../widgets/general_widgets/profile_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.id = 0,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Response>(
        future: id == 0 ? getMyInfo() : getUser(id),
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
                  List favorites;
                  int userId;
                  if (id == 0) {
                    favorites = jsonDecode(snapshot.data!.body)["favorites"];
                    userId = jsonDecode(snapshot.data!.body)["user_id"];
                  } else {
                    favorites =
                        jsonDecode(snapshot.data!.body)["info"]["favorites"];
                    userId = id;
                  }

                  return ProfileBuilder(
                    userId: userId,
                    favorites: favorites,
                  );
                }

                return const Text("Not Found");
              }
          }
        },
      ),
    );
  }
}
