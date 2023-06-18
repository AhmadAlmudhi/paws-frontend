import 'package:flutter/material.dart';

class textform extends StatefulWidget {
  const textform({super.key});

  @override
  textformState createState() {
    return textformState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class textformState extends State<textform> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<textformState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Animal Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                // labelText: 'Name',
                hintText: ' name',
              ),
              //   autofillHints:,
              cursorColor: Colors.black,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
