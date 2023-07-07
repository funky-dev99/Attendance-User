import 'package:talent/pages/leave_main.dart';
import 'package:talent/secondUser_Pages/second_home.dart';
import 'package:talent/secondUser_Pages/second_tabs/leave_approva.dart';
import 'package:talent/secondUser_Pages/second_tabs/leave_req.dart';
import 'package:flutter/material.dart';

class SecLeaveMain extends StatelessWidget {
  const SecLeaveMain({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Leave",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            leading: IconButton(
              icon: Image.asset("images/back.png"),
              iconSize: 20,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  SecondHome()));
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
              )
            ],
            elevation: 0.0,
          ),
          body: Column(
            children:  [
              TabBar(tabs: [
                Tab(
                  child: Text(
                    'Request',
                    style: TextStyle(color: Colors.black),
                  ),

                ),
                Tab(
                  child: Text(
                    'Approval',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
              Expanded(child: TabBarView(children: [
                SecLeaveReq(),
                SecLeaveApproval(),
              ]))
            ],
          ),
        )

    );
  }
}
