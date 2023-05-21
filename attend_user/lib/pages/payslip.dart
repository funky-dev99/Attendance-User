import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class PaySlipPage extends StatelessWidget {
  const PaySlipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Payment details",
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

    );
  }
}
