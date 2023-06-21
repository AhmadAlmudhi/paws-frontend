import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paws_frontend/screens/Nav_screens/nav_bar_screens.dart';
import 'package:paws_frontend/services/user_api.dart';

import '../widgets/general_widgets/loading.dart';
import '../widgets/image_paker.dart';

//class UpdateProfileScreen extends StatelessWidget

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    super.key,
    required this.initName,
    required this.initBio,
    required this.initCountry,
    required this.initCity,
    required this.initEmail,
    required this.initWhatsapp,
    required this.initPhone,
    required this.initGender,
    required this.initAge,
    required this.initImage,
  });

  final String initName,
      initBio,
      initCountry,
      initCity,
      initEmail,
      initWhatsapp,
      initPhone,
      initGender,
      initImage;

  final int initAge;

  @override
  UpdateProfileScreenState createState() {
    return UpdateProfileScreenState();
  }
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  Imagepicker controller = Get.put(Imagepicker());

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
              loading(context);
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

              if (controller.imagePath.isNotEmpty) {
                await updateProfileImage(File(controller.imagePath.toString()));
              }

              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarScreens(
                        currentIndex: 2,
                      ),
                    ),
                    (Route<dynamic> route) => false);
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
            controller.imagePath.isNotEmpty
                ? Image.file(
                    File(controller.imagePath.toString()),
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  )
                : Image.network(
                    widget.initImage,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
            TextButton(
              //---------------
              onPressed: () async {
                await controller.getImage();
                setState(() {});
                print(controller.imagePath);
                print(
                  File(controller.imagePath.toString()),
                );
              },
              child: const Text(
                "Update Picture",
                style: TextStyle(color: Colors.blue, fontSize: 20),
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
