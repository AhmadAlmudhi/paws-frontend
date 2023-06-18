import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.info1, required this.info2});
  final String info1;
  final String info2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info1,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
        Text(
          info2,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
