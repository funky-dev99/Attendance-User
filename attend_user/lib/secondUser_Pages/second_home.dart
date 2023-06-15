import 'package:attend_user/secondUser_Pages/second_attendance.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';


class SecondHome extends StatelessWidget {
  SecondHome({Key? key}) : super(key: key);

  final List<String> containerTexts = [
    'Attendance',
    'Leave',
    'Claim Request',
    'Pay Slip',
    'Ask',
    'Settings',
  ];

  final List<String> imagePaths = [
    'images/attend.png',
    'images/leave.png',
    'images/claim.png',
    'images/payslip.png',
    'images/ask.png',
    'images/set.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.home_rounded, size: 30.0,),
          color: Colors.black,
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 30.0,),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfilePage()
              //   ),
              // );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined, size: 30.0,),
            color: Colors.black,
            tooltip: 'Notifications',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationPage()),
              // );
            },
          ),
          IconButton(
            icon: const Icon(Icons.login_outlined, size: 30.0,),
            color: Colors.black,
            tooltip: 'Notifications',

            onPressed: () async {
              // Clear shared preferences login data
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              // Navigate back to the Login screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                    (
                    route) => false, // This will remove all the routes until the Login screen
              );
            },

          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return _buildContainer(index, context);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 145.0,
        height: 145.0,
        child: MaterialButton(
          onPressed: () {
            switch (index) {
              case 0:
                _handleContainer0Pressed(context);
                break;
              case 1:
                _handleContainer1Pressed(context);
                break;
              case 2:
                _handleContainer2Pressed(context);
                break;
              case 3:
                _handleContainer3Pressed(context);
                break;
              case 4:
                _handleContainer4Pressed(context);
                break;
              case 5:
                _handleContainer5Pressed(context);
                break;
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2.0,
          color: Colors.white,
          textColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePaths[index],
                width: 125.0,
                height: 100.0,
              ),
              SizedBox(height: 10.0),
              Text(
                containerTexts[index],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleContainer0Pressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondAttendMain()),
    );
  }

  void _handleContainer1Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LeaveMain()),
    // );
  }

  void _handleContainer2Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ClaimPage()),
    // );
  }

  void _handleContainer3Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PaySlipPage()),
    // );
  }

  void _handleContainer4Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AskPage()),
    // );
  }

  void _handleContainer5Pressed(BuildContext context) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Settings()),
    //   );
    // }
  }
}
