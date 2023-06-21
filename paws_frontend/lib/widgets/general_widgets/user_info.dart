import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/tabs.dart';

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
      required this.phone,
      required this.userId,
      required this.favorites});

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
  final int age, userId;

  final List favorites;

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
                  Visibility(
                    visible: name.isNotEmpty,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
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
          // Visibility(visible: bio !="empty" , child: Text(gender),),
          Visibility(visible: bio.isNotEmpty, child: Text(bio)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Visibility(
                      visible: city.isNotEmpty || country.isNotEmpty,
                      child: const Icon(Icons.location_on_sharp)),
                  Visibility(visible: city.isNotEmpty, child: Text(city)),
                  Visibility(
                      visible: city.isNotEmpty && country.isNotEmpty,
                      child: const Text(' ,')),
                  Visibility(
                      visible: country.isNotEmpty, child: Text(" $country"))
                ],
              ),
              Row(
                children: [
                  Visibility(
                    visible: gender.isNotEmpty,
                    child: Text(gender),
                  ),
                  Visibility(
                      visible: gender.isNotEmpty && age != 0,
                      child: const Text(' |')),
                  Visibility(
                    visible: age != 0,
                    child: Text(" $age years"),
                  )
                ],
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 248, 212, 177),),
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
                                    style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.bold) ,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  const Icon(Icons.email_outlined),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    email,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: Row(
                                  children: [
                                    const Icon(Icons.messenger_outline_sharp),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      whatsapp,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone_in_talk_outlined),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    phone,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
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
          tabs(
            userId: userId,
            favorites: favorites,
          ),
        ],
      ),
    );
  }
}
