import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.pageName});
  final String text;
  final Widget pageName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return pageName;
                      },
                    ),
                  );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(14),
        backgroundColor: const Color.fromARGB(255, 226, 172, 117),
        fixedSize: const Size(244, 52),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Color.fromARGB(5, 255, 255, 255),
        ),
      ),
    );
  }
}
