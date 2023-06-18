import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:paws_frontend/screens/home_screen.dart';
import 'package:paws_frontend/widgets/general_widgets/button.dart';

import '../widgets/animal_info/icon_row.dart';
import '../widgets/animal_info/info_column.dart';

class AnimalInfo extends StatelessWidget {
  const AnimalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ImageSlideshow(
                      height: MediaQuery.of(context).size.height *0.4,
                      children: [
                        Image.network(
                            'https://hips.hearstapps.com/hmg-prod/images/domestic-cat-lies-in-a-basket-with-a-knitted-royalty-free-image-1592337336.jpg?crop=0.668xw:1.00xh;0.247xw,0&resize=1200:*',
                            fit: BoxFit.cover),
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/1200px-Cat_November_2010-1a.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const IconRow(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
                  child: Stack(
                    children: [
                      Container(
                        height: 178,
                        width: 366,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 248, 212, 177),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 18, 24, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoColumn(info1: 'Name',info2: 'type', info3: 'breed', info4: 'color', info5: 'age'),
                           InfoColumn(info1: 'status', info2: 'gender', info3: 'fixed', info4: 'vaccinated', info5: 'microchipped'), 

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(18, 14, 18, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage(
                                'https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Owner',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 95, 94, 94),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '24.1,2022',
                            style: TextStyle(
                              color: Color.fromARGB(255, 95, 94, 94),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 14, 32, 0),
                  child: Text(
                    'hi ! martha want to go home , she is happy and excited cat love to play to much ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 94, 94),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Button(text: 'Visit profile', pageName: HomeScreen())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
