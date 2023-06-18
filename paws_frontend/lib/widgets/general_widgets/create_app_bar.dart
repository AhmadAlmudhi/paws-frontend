import 'package:flutter/material.dart';

AppBar createAppBar({
  required BuildContext context,
  required String title,
  required IconData icon,
  required Widget iconDestination,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => iconDestination),
          );
        },
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    ],
  );
}
