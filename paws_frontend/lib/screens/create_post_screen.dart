import 'package:flutter/material.dart';
import 'package:paws_frontend/services/post_api.dart';
import 'package:paws_frontend/widgets/general_widgets/loading.dart';

import '../widgets/general_widgets/image_upload.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, required this.type});

  final String type;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    TextEditingController breedController = TextEditingController();
    TextEditingController colorController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController microchippedController = TextEditingController();
    TextEditingController vaccinatedController = TextEditingController();
    TextEditingController fixedController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 249, 247, 247),
                  // boxShadow: BoxShadow({}),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "NEW POST",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Animal Info",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  hintText: 'name',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: typeController,
                                decoration: const InputDecoration(
                                  hintText: 'type',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter type';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: breedController,
                                decoration: const InputDecoration(
                                  hintText: 'breed',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter breed';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: colorController,
                                decoration: const InputDecoration(
                                  hintText: 'Color',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter color';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: genderController,
                                decoration: const InputDecoration(
                                  hintText: 'Gender',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Gender';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: ageController,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Age';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: microchippedController,
                                decoration: const InputDecoration(
                                  hintText: 'Microchipped',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter  text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: vaccinatedController,
                                decoration: const InputDecoration(
                                  hintText: 'Vaccinated',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: fixedController,
                                decoration: const InputDecoration(
                                  hintText: 'Fixed',
                                ),
                                //   autofillHints:,
                                cursorColor: Colors.black,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Content",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: contentController,
                          decoration: const InputDecoration(
                            hintText: 'Content',
                          ),
                          //   autofillHints:,
                          cursorColor: Colors.black,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter content';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const ImagePickerScreen(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  loading(context);
                  await createPost({
                    "post_type": widget.type,
                    "name": nameController.text,
                    "type": typeController.text,
                    "breed": breedController.text,
                    "color": colorController.text,
                    "gender": genderController.text,
                    "age": ageController.text,
                    "microchipped":
                        microchippedController.text == "microchipped",
                    "vaccinated": vaccinatedController.text == "vaccinated",
                    "fixed": fixedController.text == "fixed",
                    "content": contentController.text,
                  }, []);

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(14),
                  backgroundColor: const Color.fromARGB(255, 226, 172, 117),
                  fixedSize: const Size(244, 52),
                  elevation: 0,
                ),
                //  style: const ButtonStyle( B elevation: 0.2, ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
