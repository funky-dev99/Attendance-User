import 'package:talent/pages/attendance.dart';
import 'package:talent/pages/tabs/filter.dart';
import 'package:talent/pages/tabs/mark_in.dart';
import 'package:talent/pages/tabs/mark_out.dart';
import 'package:talent/pages/profile.dart';
import 'package:flutter/material.dart';



class AttendanceRec extends StatelessWidget {
  const AttendanceRec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  MaterialPageRoute(builder: (context) => const AttendanceMain()));
            },
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(
          //       Icons.person,
          //       size: 30.0,
          //     ),
          //     color: Colors.black,
          //     tooltip: 'View Profile',
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const ProfilePage()));
          //     },
          //   )
          // ],
          elevation: 0.0,
        ),
        body: Column(
          children: const [
            TabBar(tabs: [
              Tab(
                child: Text(
                  'IN',
                  style: TextStyle(color: Colors.black),
                ),

              ),
              Tab(
                child: Text(
                  'OUT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.filter_alt_sharp,
                  color: Colors.black,
                ),
              )
            ]),
            Expanded(child: TabBarView(children: [
              MarkIn(),
              MarkOut(),
              Filter(),
            ]))
          ],
        ),
      ),
    );
  }
}
