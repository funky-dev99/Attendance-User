import 'package:attend_user/secondUser_Pages/second_home.dart';
import 'package:attend_user/secondUser_Pages/second_tabs/second_qr.dart';
import 'package:attend_user/secondUser_Pages/second_tabs/second_qr_scan.dart';
import 'package:flutter/material.dart';

class SecondAttendQR extends StatelessWidget {
  const SecondAttendQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Attendance",
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
            children: const [
              TabBar(tabs: [
                Tab(
                  child: Text(
                    'My QR',
                    style: TextStyle(color: Colors.black),
                  ),

                ),
                Tab(
                  child: Text(
                    'Scan QR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
              Expanded(child: TabBarView(children: [
                SecondQr(),
                SecondQrScan(),
              ]))
            ],
          ),
        )

    );
  }
}
