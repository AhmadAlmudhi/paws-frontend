import 'package:flutter/material.dart';

class ContactRow extends StatelessWidget {
  const ContactRow(
      {super.key,
      required this.contactType,
      required this.contacinfo,
      required this.icon});

  final IconData icon;
  final String contactType;
  final String contacinfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contactType),
            Text(
              contacinfo,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
