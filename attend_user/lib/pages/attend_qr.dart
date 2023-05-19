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
                context,
                MaterialPageRoute(
                    builder: (context) => const AttendanceMain()));
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: const Center(
            child: Text(
              'QR Code',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),

      );
  }
}


