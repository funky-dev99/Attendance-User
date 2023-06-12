import 'package:attend_user/pages/attend_qr.dart';
import 'package:attend_user/pages/attendance_rec.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../methods/methods.dart';
import 'attend_location.dart';

class AttendanceMain extends StatelessWidget {
  const AttendanceMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          iconSize: 20,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30.0,
            ),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          )
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AttendLoc())); // Add your logic here for the first button
              },
              padding: const EdgeInsets.all(10),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.grey, // Gray border color
                  width: 1, // Border width
                ),
              ),
              minWidth: 200,
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'images/wloc.png',
                    height: 90,
                    width: 190,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mark With Location',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ), // White background color
            ),
            SizedBox(height: getSizeBoxHeight(context)),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AttendQr()));
              },
              padding: EdgeInsets.all(10),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey, // Gray border color
                  width: 1, // Border width
                ),
              ),
              minWidth: 200,
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'images/wqr.png',
                    height: 90,
                    width: 190,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mark With QR',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ), // White background color
            ),
            SizedBox(height: getSizeBoxHeight(context)),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const AttendanceRec())); // Add your logic here for the first button
              },
              padding: EdgeInsets.all(10),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey, // Gray border color
                  width: 1, // Border width
                ),
              ),
              minWidth: 200,
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'images/rec.png',
                    height: 90,
                    width: 190,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Attendance Record',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ), // White background color
            ),
          ],
        ),
      ),
    );
  }
}
