import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get_storage/get_storage.dart';

import '../../../screens/home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
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

          if (res.statusCode == 200) {
            final box = GetStorage();
            box.write('token', jsonDecode(res.body)['TOKEN']);
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            }
          }
          if (res.statusCode == 400) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Wrong email or password'),
              duration: Duration(seconds: 6),
            ));
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}
