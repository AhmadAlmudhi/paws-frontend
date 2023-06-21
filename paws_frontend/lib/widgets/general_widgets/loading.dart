import 'package:flutter/material.dart';

void loading(BuildContext context) {
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
}
