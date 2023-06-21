import 'package:flutter/material.dart';

AppBar createAppBar({
  required BuildContext context,
  required String title,
  required IconData icon,
  required Widget iconDestination,
  required Function update,
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
          ).then((value) => update.call());
        },
        icon: Icon(icon),
      ),
    ],
  );
}
