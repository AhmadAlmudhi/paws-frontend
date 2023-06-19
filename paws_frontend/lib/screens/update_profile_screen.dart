import 'package:flutter/material.dart';

//class UpdateProfileScreen extends StatelessWidget

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  UpdateProfileScreenState createState() {
    return UpdateProfileScreenState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<UpdateProfileScreenState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          leading: TextButton(
            onPressed: () {
              //context.pop();
            },
            child: const Text("Cancel", style: TextStyle(fontSize: 12)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // context.pop();
                Navigator.of(context).pop();
              },
              child: const Text("Done", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRRv9ICxXjK-LVFv-lKRId6gB45BFoNCLsZ4dk7bZpYGblPLPG-9aYss0Z0wt2PmWDb"),
              ),
              TextButton(
                //---------------
                onPressed: () {
                  //context.pushPage(adoubt());
                  Navigator.of(context).pop();
                },
                child: const Text("UpdateProfileScreen Picture",
                    style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(
                height: 5,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: ' Bio',
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
                    const SizedBox(
                      height: 90,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Country',
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
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'City',
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
                    const SizedBox(
                      height: 90,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Email',
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
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Whatsapp',
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
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Phone',
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
                    const SizedBox(
                      height: 90,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Info",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Gender',
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
                    TextFormField(
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Age',
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
              // const location(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //    Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      //   If the form is valid, display a snackbar. In the real world,
                      //   you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
