import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

//--

//--
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final controller = MultiImagePickerController(
    maxImages: 5,

    //allowedImageTypes: ['png', 'jpg', 'jpeg'],
    // withData: true,
    //withReadStream: true,
  );
  final imagePaths = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 226, 172, 117))),
          onPressed: () => pickImage(),
          child: const Text(
            "Add images",
            style: TextStyle(fontSize: 20),
          ),
        ),
        if (imagePaths.isEmpty) const Text(""),
        if (imagePaths.isNotEmpty)
          SizedBox(
            height: 100,
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(4),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 1,
              children: imagePaths.map((e) => Image.file(File(e))).toList(),
            ),
          )
      ],
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickMultiImage();

      setState(() {
        imagePaths.clear();
        for (var element in image) {
          File f = File(element.path);
          pickedImages.add(f);
          imagePaths.add(element.path);
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}

final List<File> pickedImages = [];
