import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key, required this.info1, required this.info2, required this.info3, required this.info4, required this.info5});
  final String info1;
  final String info2;
  final String info3;
  final String info4;
  final String info5;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info1,
          style: const TextStyle(
              
              fontWeight: FontWeight.bold,fontSize: 18),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          info2,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          info4,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          info3,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          info5,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 94),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
