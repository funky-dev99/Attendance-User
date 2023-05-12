import 'package:flutter/material.dart';

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
        elevation: 0.0,
      ),
    );
  }
}
