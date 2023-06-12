// // import 'package:flutter/material.dart';
// //
// // import '../home.dart';
// //
// // class ProfileMainPage extends StatelessWidget {
// //   final String id;
// //   final String fullName;
// //   final String email;
// //   final String password;
// //
// //   const ProfileMainPage({
// //     Key? key,
// //     required this.id,
// //     required this.fullName,
// //     required this.email,
// //     required this.password,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         title: const Text(
// //           "My Profile",
// //           style: TextStyle(color: Colors.black, fontSize: 22),
// //         ),
// //         leading: IconButton(
// //           icon: Image.asset("images/back.png"),
// //           onPressed: () {
// //             Navigator.push(
// //                 context, MaterialPageRoute(builder: (context) => HomePage()));
// //           },
// //         ),
// //         elevation: 0.0,
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text("Company ID: $id"),
// //               Text("Full Name: $fullName"),
// //               Text("Company Email: $email"),
// //               Text("My Password: $password"),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'profile.dart';
//
// class ProfileMainPage extends StatelessWidget {
//   final String id;
//   final String fullName;
//   final String email;
//   final String password;
//   final File? imageFile;
//
//   const ProfileMainPage({
//     required this.id,
//     required this.fullName,
//     required this.email,
//     required this.password,
//     this.imageFile,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Main Page'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 80,
//                 backgroundImage: imageFile != null
//                     ? FileImage(imageFile!)
//                     : const NetworkImage(
//                   'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'ID: $id',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Full Name: $fullName',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Email: $email',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Password: $password',
//               style: const TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';

import '../home.dart';

class ProfileMainPage extends StatelessWidget {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final File? imageFile;

  const ProfileMainPage({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 130,
                height: 130,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : const NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                  ) as ImageProvider<Object>,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Company ID: $id',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Full Name: $fullName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Company Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'My Password: $password',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
