// import 'package:attend_user/pages/attendance.dart';
// import 'package:attend_user/pages/profile.dart';
// import 'package:flutter/material.dart';
//
// import 'dart:async';
// import 'dart:ui' as ui;
//
// import 'package:flutter/services.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class AttendQr extends StatefulWidget {
//   const AttendQr({Key? key}) : super(key: key);
//
//   @override
//   State<AttendQr> createState() => _AttendQrState();
// }
//
// class _AttendQrState extends State<AttendQr> {
//   ui.Image? image; // Declare ui.Image as a class member
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImage(); // Call _loadImage in the initState method
//   }
//
//   Future<void> _loadImage() async {
//     final data = await rootBundle.load('assets/qr.png');
//     final loadedImage = await decodeImageFromList(data.buffer.asUint8List());
//     setState(() {
//       image = loadedImage;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const message = 'My QR';
//
//     final qrCode = image != null // Use the loaded image in FutureBuilder
//         ? CustomPaint(
//       size: const Size.square(350),
//       painter: QrPainter(
//         data: message,
//         version: QrVersions.auto,
//         color: Colors.black,
//         emptyColor: Colors.white70,
//         embeddedImage: image,
//         embeddedImageStyle: QrEmbeddedImageStyle(
//           size: Size.square(50),
//         ),
//       ),
//     )
//         : Container(
//       color: Colors.teal,
//       height: 350,
//       width: 350,
//     );
//
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
//             icon: Icon(Icons.person, size: 30.0,),
//             color: Colors.black,
//             tooltip: 'View Profile',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProfilePage()),
//               );
//             },
//           )
//         ],
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             qrCode,
//             const SizedBox(height: 30.0),
//             const Text(
//               message,
//               style: TextStyle(fontSize: 25.0,
//               fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:attend_user/pages/attendance.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttendQr extends StatefulWidget {
  const AttendQr({Key? key}) : super(key: key);

  @override
  State<AttendQr> createState() => _AttendQrState();
}

class _AttendQrState extends State<AttendQr> {
  ui.Image? image; // Declare ui.Image as a class member

  @override
  void initState() {
    super.initState();
    _loadImage(); // Call _loadImage in the initState method
  }

  Future<void> _loadImage() async {
    final data = await rootBundle.load('assets/qr.png');
    final loadedImage = await decodeImageFromList(data.buffer.asUint8List());
    setState(() {
      image = loadedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    const message = 'My QR';

    final qrCode = image != null // Use the loaded image in FutureBuilder
        ? CustomPaint(
      size: const Size.square(350),
      painter: QrPainter(
        data: message,
        version: QrVersions.auto,
        color: Colors.black,
        emptyColor: Colors.white70,
        embeddedImage: image,
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size.square(50),
        ),
      ),
    )
        : Container(
      color: Colors.teal,
      height: 350,
      width: 350,
    );


    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                context,
                MaterialPageRoute(builder: (context) => const AttendanceMain()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person, size: 30.0,),
              color: Colors.black,
              tooltip: 'View Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            )
          ],
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              qrCode,
              const SizedBox(height: 30.0),
              const Text(
                message,
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
