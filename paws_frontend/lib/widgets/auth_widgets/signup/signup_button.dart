import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/screens/auth_screens/verfiy_email_screen.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.onSubmit,
  });

  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: () async {
          Response res = await onSubmit.call();

          if (res.statusCode == 201) {
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerfiyEmailScreen(
                    userEmail: jsonDecode(res.body)["email"],
                  ),
                ),
              );
            }
          }
        },
        child: const Text("Signup"),
      ),
    );
  }
}
