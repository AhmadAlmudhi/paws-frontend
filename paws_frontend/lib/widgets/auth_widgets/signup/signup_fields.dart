import 'package:flutter/material.dart';

import '../../general_widgets/custom_text_field.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController nameController;
  final TextEditingController phoneController;

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
        CustomTextField(
          controller: usernameController,
          label: "Username",
          hint: "user123",
        ),
        CustomTextField(
          controller: nameController,
          label: "Name",
          hint: "Ahmad",
        ),
        CustomTextField(
          controller: phoneController,
          label: "Phone",
          hint: "0500000000",
        ),
      ],
    );
  }
}
