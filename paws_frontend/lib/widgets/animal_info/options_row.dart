import 'package:flutter/material.dart';

class OptionsRow extends StatelessWidget {
  const OptionsRow(
      {super.key,
      required this.text,
      required this.icon,
      this.isDelet = false});
  final String text;
  final IconData icon;
  final bool isDelet;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 58,
          width: 366,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 196, 194, 194), blurRadius: 7),
            ],
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 0, 0),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDelet ? Colors.red : Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: TextStyle(
                  color: isDelet ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
