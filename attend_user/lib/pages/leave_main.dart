import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'leave.dart';

class LeaveMain extends StatelessWidget {
  const LeaveMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Leave",
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
          IconButton(icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePage()));},)

        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  Leave()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Sets the background color
              onPrimary: Colors.white, // Sets the text color
              minimumSize: const Size(150, 50), // Sets the minimum size of the button
            ),
            child: const
            Text('Request',

              style: TextStyle(fontSize: 18,),),
          )

        ],
      ),

    );
  }
}
