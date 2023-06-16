import 'package:flutter/material.dart';
import '../../../screens/auth_screens/login_screen.dart';

class ConfirmCancelButtons extends StatelessWidget {
  const ConfirmCancelButtons({
    super.key,
    required this.onConfirm,
  });

  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (Route<dynamic> route) => false);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: () async {
            onConfirm.call();
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
