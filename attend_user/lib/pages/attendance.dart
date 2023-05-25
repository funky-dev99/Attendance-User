import 'package:attend_user/pages/attend_qr.dart';
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  HomePage()));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.person),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePage()));},)

        ],
        elevation: 0.0,
      ),

      body: Center(
        child: Column(

          children: [
            SizedBox(height: getSizeBoxHeightL(context),),

            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const AttendLoc()));
              },
              child: Image.asset('images/wloc.png'),
            ),

            SizedBox(height: getSizeBoxHeight(context),),

            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const AttendQr()));
              },
              child: Image.asset('images/wqr.png'),
            ),

          ],
        ),
      ),
    );
  }
}
