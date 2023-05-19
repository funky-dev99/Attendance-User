import 'package:attend_user/pages/attendance.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

class AttendQr extends StatelessWidget {
  const AttendQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Mark With QR",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AttendanceMain()));
          },
        ),
        actions: [
          IconButton(icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));},)

        ],
        elevation: 0.0,
      ),

    );
  }
}


















// import 'package:attend_user/pages/attendance.dart';
// import 'package:attend_user/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// // import 'package:qr_image/qr_image.dart';
// // import 'package:qr/src/qr_image.dart';
//
//
// class AttendQr extends StatefulWidget {
//   const AttendQr({Key? key}) : super(key: key);
//
//   @override
//   _AttendQrState createState() => _AttendQrState();
// }
//
// class _AttendQrState extends State<AttendQr> {
//   final GlobalKey globalKey = GlobalKey();
//   String qrData = "";
//
//   @override
//   Widget build(BuildContext context) {
//     var image;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Mark With QR",
//           style: TextStyle(color: Colors.black, fontSize: 22),
//         ),
//         leading: IconButton(
//           icon: Image.asset("images/back.png"),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AttendanceMain()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Image.asset("images/pro.png"),
//             tooltip: 'View Profile',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProfilePage()),
//               );
//             },
//           ),
//         ],
//         elevation: 0.0,
//       ),
//
//     );

//       body: SingleChildScrollView(
//         child: Column(
//             children: [
//             const SizedBox(height: 30),
//         RepaintBoundary(
//           key: globalKey,
//           child: Container(
//             color: Colors.white,
//             child: Center(
//                 child: qrData.isEmpty
//                     ? const Text(
//                   "Enter ID",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//             //     : Image(
//             //   image: QrImage(
//             //     data: qrData,
//             //     version: QrVersions.auto,
//             //     size: 200,
//             //   ).image,
//             // ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 50,
//       ),
//       SizedBox(
//         width: MediaQuery.of(context).size.width * .9,
//         child: TextField(
//           decoration: const InputDecoration(
//             hintText: "Enter ID",
//             border: OutlineInputBorder(),
//           ),
//           onChanged: (value) {
//             setState(() {
//               qrData = value;
//             });
//           },
//         ),
//       ),
//       ],
//     ),
//     ),
//     );
//   }
// }


