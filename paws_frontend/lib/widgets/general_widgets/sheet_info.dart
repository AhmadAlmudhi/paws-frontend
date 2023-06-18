import 'package:flutter/material.dart';

import 'contact_row.dart';

class SheetInfo extends StatelessWidget {
  const SheetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('test'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    18,
                    18,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const ContactRow(
                          contactType: 'email',
                          contacinfo: 'e@gmail',
                          icon: Icons.email_outlined),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
