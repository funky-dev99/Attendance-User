import 'package:flutter/material.dart';
import 'package:talent/secondUser_Pages/second_attendance.dart';

class SecAttendRec extends StatelessWidget {
  const SecAttendRec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Attendance Record",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          iconSize: 20,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondAttendMain()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              size: 30.0,
            ),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
        elevation: 0.0,
      ),
    );
  }
}
