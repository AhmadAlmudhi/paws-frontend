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
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 248, 212, 177))),
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
          if (res.statusCode == 400) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Please enter all information'),
                  duration: Duration(seconds: 6),
                ),
              );
            }
          }
        },
        child: const Text(
          "Signup",
          style: TextStyle(color: Color.fromARGB(255, 11, 11, 11)),
        ),
      ),
    );
  }
}
