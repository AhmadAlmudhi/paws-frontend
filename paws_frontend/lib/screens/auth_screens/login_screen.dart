import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/auth_screens/forgot_password_screen.dart';
import '../../services/auth_api.dart';
import '../../widgets/general_widgets/card_title.dart';
import '../../widgets/auth_widgets/login/login_button.dart';
import '../../widgets/auth_widgets/login/login_fields.dart';
import '../../widgets/auth_widgets/login/signup_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CardTitle(title: "Login"),
                      LoginFields(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      LoginButton(
                        onSubmit: () {
                          return login(
                            {
                              "email": emailController.text,
                              "password": passwordController.text,
                            },
                          );
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()),
                            );
                          },
                          child: const Text("Forgot Password?")),
                      const SignupMessage(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
