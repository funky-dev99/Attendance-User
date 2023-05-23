import 'package:attend_user/pages/askpage.dart';
import 'package:attend_user/pages/attendance.dart';
import 'package:attend_user/pages/claim_page.dart';
import 'package:attend_user/pages/leave_main.dart';
import 'package:attend_user/pages/notification.dart';
import 'package:attend_user/pages/payslip.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:attend_user/pages/setting.dart';
import 'package:flutter/material.dart';

import 'methods/methods.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          icon: Image.asset("images/home.png"),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          IconButton(icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));},),

          IconButton(icon: Icon(Icons.notifications_active_outlined),color: Colors.black,
            tooltip: 'Notifications',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));},)
        ],
        elevation: 0.0,
      ),
      body: Column(

        children: [
          SizedBox(height: getSizeBoxHeightL(context)),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AttendanceMain()));
                  },
                  child: Image.asset('images/attendance.png'),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>  LeaveMain()));
                  },
                  child: Image.asset('images/leave.png'),
                ),
              ),



            ],
          ),

          SizedBox(height: getSizeBoxHeight(context),),

          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ClaimPage()));
                  },
                  child: Image.asset('images/claim.png'),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PaySlipPage()));

                  },
                  child: Image.asset('images/pay.png'),
                ),
              ),



            ],
          ),

          SizedBox(height: getSizeBoxHeight(context),),

          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AskPage()));
                  },
                  child: Image.asset('images/ask.png'),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Settings()));
                  },
                  child: Image.asset('images/set.png'),
                ),
              ),



            ],
          ),




        ],
      ),
    );
  }
}
