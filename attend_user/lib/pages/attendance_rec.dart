import 'package:attend_user/pages/attendance.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class AttendanceRec extends StatelessWidget {
  const AttendanceRec({Key? key}) : super(key: key);

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  AttendanceMain()));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.person, size: 30.0,),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePage()));},)

        ],
        elevation: 0.0,
      ),
    );
  }
}