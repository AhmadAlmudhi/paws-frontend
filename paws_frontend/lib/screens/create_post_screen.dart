import 'package:flutter/material.dart';

import '../widgets/general_widgets/image_upload.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 1000,
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
                                decoration: const InputDecoration(
                                  hintText: ' name',
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

                        const ImagePickerScreen(),

                        // ElevatedButton(
                        //   onPressed: () {
                        //     context.pushPage( ImagePickerScreen());
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     shape: const StadiumBorder(),
                        //     padding: const EdgeInsets.all(3),
                        //     backgroundColor:
                        //         const Color.fromARGB(255, 226, 172, 117),
                        //     fixedSize: const Size(420, 100),
                        //     elevation: 0,
                        //   ),
                        //   child: const Text(
                        //     "Upload",
                        //     style: TextStyle(
                        //       fontSize: 22,
                        //       color: Color.fromARGB(202, 255, 255, 255),
                        //     ),
                        //   ),
                        // ),
                        // const EditImageScreen(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    //   If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
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
