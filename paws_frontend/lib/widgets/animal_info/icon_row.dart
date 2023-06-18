import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/animal_info/options_row.dart';

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
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          18,
                          18,
                          18,
                          0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                                onTap: () {},
                                child: const OptionsRow(
                                    text: 'Edite post',
                                    icon: Icons.edit_outlined)),
                            const SizedBox(
                              height: 8,
                            ),
                            InkWell(
                                onTap: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Delete post'),
                                        content: const Text(
                                            'Are you sure you wants to delete this post?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'Delete'),
                                            child: const Text('Delete',style: TextStyle(color: Colors.red),),
                                          ),
                                        ],
                                      ),
                                    ),
                                child: const OptionsRow(
                                  text: 'Delete',
                                  icon: Icons.delete_forever_outlined,
                                  isDelet: true,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
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
