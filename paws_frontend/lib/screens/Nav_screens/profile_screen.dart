import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/services/user_api.dart';
import '../../widgets/general_widgets/profile_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: getMyInfo(),
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
                List favorites = jsonDecode(snapshot.data!.body)["favorites"];
                return ProfileBuilder(
                  userId: jsonDecode(snapshot.data!.body)["user_id"],
                  favorites: favorites,
                );
              }

              return const Text("Not Found");
            }
        }
      },
    );
  }
}
