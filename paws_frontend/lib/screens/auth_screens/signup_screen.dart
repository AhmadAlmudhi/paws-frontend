import 'package:flutter/material.dart';
import '../../services/auth_api.dart';
import '../../widgets/auth_widgets/signup/login_message.dart';
import '../../widgets/auth_widgets/signup/signup_button.dart';
import '../../widgets/auth_widgets/signup/signup_fields.dart';
import '../../widgets/general_widgets/card_title.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.pets_outlined,
                          size: 105,
                          color: const Color.fromARGB(255, 217, 153, 88)
                              .withOpacity(0.3),
                        ),
                        const Text(
                          "PAWS",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Transform.rotate(
                        angle: 0.6,
                        child: Icon(
                          Icons.pets_outlined,
                          size: 29,
                          color: Colors.brown.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 75,
                      child: Transform.rotate(
                        angle: -0.8,
                        child: Icon(
                          Icons.pets_outlined,
                          size: 29,
                          color: Colors.brown.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 40,
                      child: Transform.rotate(
                        angle: 0.4,
                        child: Icon(
                          Icons.pets_outlined,
                          size: 28,
                          color: Colors.brown.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CardTitle(title: "Signup"),
                    SignupFields(
                      emailController: emailController,
                      passwordController: passwordController,
                      usernameController: usernameController,
                      nameController: nameController,
                      phoneController: phoneController,
                    ),
                    SignupButton(
                      onSubmit: () {
                        return signup(
                          {
                            "email": emailController.text,
                            "password": passwordController.text,
                            "username": usernameController.text,
                            "name": nameController.text,
                            "phone": phoneController.text,
                          },
                        );
                      },
                    ),
                    const LoginMessage(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
