import 'package:flutter/material.dart';

import '../home.dart';

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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
    );
  }
}
