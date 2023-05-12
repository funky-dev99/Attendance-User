import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  //Logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //Welcome Back Text
                  const Text(
                    'Welcome back, You\'ve been missed!!',
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 25,
                  ),



                  //Username Text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(

                      controller: usernameController,
                      decoration:  InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.blueGrey,),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black45),
                          ),
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: '   User Name',
                          helperStyle: TextStyle(color: Colors.black45)),
                    ),
                  ),


                ],
              ),
            ),

          ),),

    );
  }
}
