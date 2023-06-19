import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../screens/auth_screens/login_screen.dart';
import '../../../services/auth_api.dart';

class VerfiyButton extends StatelessWidget {
  const VerfiyButton({
    super.key,
    required this.codeController,
    required this.userEmail,
  });

  final TextEditingController codeController;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: () async {
          Response res = await verify({
            "otp": codeController.text,
            "email": userEmail,
          });

          if (res.statusCode == 200) {
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
            }
          }if (res.statusCode == 400) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Wronge code'),
              duration: Duration(seconds: 6),
            ));
          }
        },
        child: const Text("Verfiy"),
      ),
    );
  }
}
