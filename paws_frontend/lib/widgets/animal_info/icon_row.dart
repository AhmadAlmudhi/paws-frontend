import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            backgroundColor: const Color.fromARGB(205, 227, 225, 225),
          ),
          child: const Icon(Icons.share_outlined, color: Colors.black),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color.fromARGB(205, 227, 225, 225),
              ),
              child: const Icon(Icons.favorite_border_outlined,
                  color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color.fromARGB(205, 227, 225, 225),
              ),
              child: const Icon(Icons.more_horiz, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
