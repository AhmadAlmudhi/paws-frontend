import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paws_frontend/widgets/general_widgets/custom_text_field.dart';
import '../../services/auth_api.dart';
import '../../widgets/auth_widgets/forgot_password/confirm_cancel_buttons.dart';
import '../../widgets/general_widgets/card_title.dart';
import 'login_screen.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController codeController = TextEditingController();

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
                      const CardTitle(title: "Update Password"),
                      const Text("Enter verification code"),
                      CustomTextField(
                        controller: passwordController,
                        label: 'Password',
                        hint: 'ABcd#1234',
                        isPassword: true,
                      ),
                      CustomTextField(
                        controller: codeController,
                        label: 'Code',
                        hint: '123456',
                      ),
                      ConfirmCancelButtons(
                        onConfirm: () async {
                          Response res = await updatePassword({
                            "email": userEmail,
                            "password": passwordController.text,
                            "code": codeController.text,
                          });

                          if (res.statusCode == 200) {
                            if (context.mounted) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (Route<dynamic> route) => false);
                            }
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

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.userEmail,
    required this.passwordController,
    required this.codeController,
  });

  final String userEmail;
  final TextEditingController passwordController;
  final TextEditingController codeController;

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
            Response res = await updatePassword({
              "email": userEmail,
              "password": passwordController.text,
              "code": codeController.text,
            });

            if (res.statusCode == 200) {
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (Route<dynamic> route) => false);
              }
            }
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
