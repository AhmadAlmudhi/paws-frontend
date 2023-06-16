import 'package:flutter/material.dart';

import '../../general_widgets/custom_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          label: "Email",
          hint: "example@gmail.com",
        ),
        CustomTextField(
          controller: passwordController,
          label: "Password",
          hint: "ABcd#1234",
          isPassword: true,
        ),
      ],
    );
  }
}
