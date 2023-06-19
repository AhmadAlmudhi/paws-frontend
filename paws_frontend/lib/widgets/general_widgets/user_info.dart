import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(
      {super.key,
      required this.name,
      required this.username,
      required this.image,
      required this.bio,
      required this.city,
      required this.country,
      required this.gender,
      required this.age,
      required this.email,
      required this.whatsapp,
      required this.phone});

  final String name,
      username,
      image,
      bio,
      city,
      country,
      gender,
      email,
      whatsapp,
      phone;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    "@$username",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(bio),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  Text("$city , $country"),
                ],
              ),
              Text("$gender | $age years"),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amberAccent),
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 64),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Center(
                                  child: Text(
                                    "Contact",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ),
                              Text(
                                "Email: $email",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: Text(
                                  "Whatsapp: $whatsapp",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                "Phone: $phone",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: const Text("contact"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
