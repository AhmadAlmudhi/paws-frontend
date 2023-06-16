import 'package:flutter/material.dart';

import '../../../services/auth_api.dart';

class SendCodeMessage extends StatelessWidget {
  const SendCodeMessage({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Didn't receive code?"),
        TextButton(
          onPressed: () {
            resendCode({"email": userEmail});
          },
          child: const Text(
            "Send new code",
          ),
        )
      ],
    );
  }
}
