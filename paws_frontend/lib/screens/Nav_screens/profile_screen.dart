import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/update_profile_screen.dart';
import 'package:paws_frontend/widgets/general_widgets/tabs.dart';

import '../../widgets/general_widgets/create_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context: context,
        title: "Profile",
        icon: Icons.edit,
        iconDestination: const UpdateProfileScreen(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRRv9ICxXjK-LVFv-lKRId6gB45BFoNCLsZ4dk7bZpYGblPLPG-9aYss0Z0wt2PmWDb"),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("name"),
                    Text(
                      "user_name",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "bio test testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.location_on_sharp),
                Text("Riyadh , Saudi Arabia"),
                SizedBox(
                  width: 90,
                ),
                Text("Male | 20 yo"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            tabs(),
          ],
        ),
      ),
    );
  }
}
