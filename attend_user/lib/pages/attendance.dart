import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          actions: [
            IconButton(icon: Image.asset("images/pro.png"),
              tooltip: 'View Profile',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));},)

          ],
        ),

      body: Center(
        child: Column(

          children: [
            SizedBox(height: 60,),

            Container(
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AttendLoc()));
                },
                child: Image.asset('images/wloc.png'),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AttendanceMain()));
                },
                child: Image.asset('images/wqr.png'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
