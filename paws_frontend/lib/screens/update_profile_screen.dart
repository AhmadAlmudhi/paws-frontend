import 'package:flutter/material.dart';
import 'package:paws_frontend/services/user_api.dart';

//class UpdateProfileScreen extends StatelessWidget

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen(
      {super.key,
      required this.initName,
      required this.initBio,
      required this.initCountry,
      required this.initCity,
      required this.initEmail,
      required this.initWhatsapp,
      required this.initPhone,
      required this.initGender,
      required this.initAge});

  final String initName,
      initBio,
      initCountry,
      initCity,
      initEmail,
      initWhatsapp,
      initPhone,
      initGender;

  final int initAge;

  @override
  UpdateProfileScreenState createState() {
    return UpdateProfileScreenState();
  }
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.initName);
    TextEditingController bioController =
        TextEditingController(text: widget.initBio);
    TextEditingController countryController =
        TextEditingController(text: widget.initCountry);
    TextEditingController cityController =
        TextEditingController(text: widget.initCity);
    TextEditingController emailController =
        TextEditingController(text: widget.initEmail);
    TextEditingController whatsappController =
        TextEditingController(text: widget.initWhatsapp);
    TextEditingController phoneController =
        TextEditingController(text: widget.initPhone);
    TextEditingController genderController =
        TextEditingController(text: widget.initGender);
    TextEditingController ageController =
        TextEditingController(text: "${widget.initAge}");

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel", style: TextStyle(fontSize: 12)),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              showDialog<String>(
                context: context,
                builder: (context) {
                  return const Scaffold(
                    backgroundColor: Color.fromARGB(30, 0, 0, 0),
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
              await updateProfile(
                {
                  "name": nameController.text,
                  "bio": bioController.text,
                  "country": countryController.text,
                  "city": cityController.text,
                  "email": emailController.text,
                  "whatsapp": whatsappController.text,
                  "phone": phoneController.text,
                  "gender": genderController.text,
                  "age": ageController.text,
                },
              );
              if (context.mounted) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: const Text("Done", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRRv9ICxXjK-LVFv-lKRId6gB45BFoNCLsZ4dk7bZpYGblPLPG-9aYss0Z0wt2PmWDb"),
            ),
            TextButton(
              //---------------
              onPressed: () {},
              child: const Text(
                "Update Picture",
                style: TextStyle(color: Colors.blue),
              ),
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
                    controller: nameController,
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
                    controller: bioController,
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
                    height: 16,
                  ),
                  const Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextFormField(
                    controller: countryController,
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
                    controller: cityController,
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
                    height: 16,
                  ),
                  const Text(
                    "Contact",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextFormField(
                    controller: emailController,
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
                    controller: whatsappController,
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
                    controller: phoneController,
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
                    height: 16,
                  ),
                  const Text(
                    "Info",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextFormField(
                    controller: genderController,
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
                    controller: ageController,
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
          ],
        ),
      ),
    );
  }
}
