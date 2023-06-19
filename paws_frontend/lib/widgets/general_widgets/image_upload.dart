import 'package:multi_image_picker_view/multi_image_picker_view.dart';

import 'package:flutter/material.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key, required this.title});
  final String title;
  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final controller = MultiImagePickerController(
    maxImages: 15,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
    withData: true,
    withReadStream: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final images = controller.images; // return Iterable<ImageFile>
          for (final image in images) {
            if (image.hasPath) {
              print(image.path!);
            } else {
              print(image.bytes!);
            }
            // request.addFileBytes(image.data!);
          }
          // request.send();
        },
        label: const Text('Pick images'),
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pick images, the max is 15',
            ),
            MultiImagePickerView(
              controller: controller,
              padding: const EdgeInsets.all(10),
              // link of selected images
            )
          ],
        ),
      ),
    );
  }
}
