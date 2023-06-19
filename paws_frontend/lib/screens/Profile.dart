// import 'package:flutter/material.dart';
// import 'package:paws_frontend/widgets/general_widgets/tabs.dart';

// class profile extends StatefulWidget {
//   const profile({super.key});

//   @override
//   profileState createState() {
//     return profileState();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class profileState extends State<profile> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<profileState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.grey,
//           title: const Text(
//             "Profile",
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 //  context.pushPage(const Edit());
//               },
//               child: const Icon(Icons.edit),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: const [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(
//                         "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRRv9ICxXjK-LVFv-lKRId6gB45BFoNCLsZ4dk7bZpYGblPLPG-9aYss0Z0wt2PmWDb"),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("name"),
//                       Text(
//                         "user_name",
//                         style: TextStyle(color: Colors.grey),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                   "bio test testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.location_on_sharp),
//                   Text("Riyadh , Saudi Arabia"),
//                   SizedBox(
//                     width: 90,
//                   ),
//                   Text("Male | 20 yo"),
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               tabs(),
//             ],
//           ),
//         ), 
//         );
//   }
// }
