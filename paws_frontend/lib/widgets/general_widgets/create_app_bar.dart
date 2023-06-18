import 'package:flutter/material.dart';

AppBar createAppBar({
  required BuildContext context,
  required String title,
  required IconData icon,
  required Widget iconDestination,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    title: Text(title),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => iconDestination),
          );
        },
        icon: Icon(icon),
      ),
    ],
  );
}
