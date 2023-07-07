import 'package:talent/pages/profile.dart';
import 'package:talent/pages/setting.dart';
import 'package:flutter/material.dart';


class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  Settings()));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.person, size: 30.0,),
            color: Colors.black,
            tooltip: 'View Profile',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePage()));},)

        ],
        elevation: 0.0,
      ),

    );
  }
}
