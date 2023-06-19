import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/widgets/general_widgets/custom_text_field.dart';
import '../../services/auth_api.dart';
import '../../widgets/auth_widgets/forgot_password/confirm_cancel_buttons.dart';
import '../../widgets/general_widgets/card_title.dart';
import 'update_password_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
                      const CardTitle(title: "Reset Password"),
                      const Text("Enter your email to reset password"),
                      CustomTextField(
                        controller: emailController,
                        label: 'Email',
                        hint: 'example@gmail.com',
                      ),
                      ConfirmCancelButtons(
                        onConfirm: () async {
                          Response res = await forgotPassword(
                            {"email": emailController.text},
                          );

                          if (res.statusCode == 200) {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdatePasswordScreen(
                                    userEmail: jsonDecode(res.body)["email"],
                                  ),
                                ),
                              );
                            }
                          }if (res.statusCode == 404) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Wrong email'),
              duration: Duration(seconds: 6),
            ));
          }
                        },
                      )
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
