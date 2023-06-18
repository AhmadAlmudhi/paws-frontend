import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        contentPadding: EdgeInsets.only(left: 34.0, top: 6),
        hintStyle:
            TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w600),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 26.0, right: 16),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
