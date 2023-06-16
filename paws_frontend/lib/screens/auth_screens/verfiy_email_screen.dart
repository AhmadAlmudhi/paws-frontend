import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/custom_text_field.dart';
import '../../widgets/general_widgets/card_title.dart';
import '../../widgets/auth_widgets/verfiy_email/send_code_message.dart';
import '../../widgets/auth_widgets/verfiy_email/verfiy_button.dart';

class VerfiyEmailScreen extends StatelessWidget {
  const VerfiyEmailScreen({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
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
                      const CardTitle(title: "Verfiy Email"),
                      CustomTextField(
                        controller: codeController,
                        label: 'Code',
                        hint: '123456',
                      ),
                      VerfiyButton(
                          codeController: codeController, userEmail: userEmail),
                      SendCodeMessage(userEmail: userEmail)
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
