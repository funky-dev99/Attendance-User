
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';




class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool userIdValidate = false;
  bool userNameValidate = false;
  bool passwordValidate = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userIdController = TextEditingController();

  @override
  void dispose() {
    userIdController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> login(BuildContext context, String userId, String userName, String password) async {
    var url = "https://talent.cbs.lk/signin.php";

    var data = {
      "user_name": userName,
      "user_id": userId,
      "password": password,
    };

    http.Response res = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName("utf-8"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      print('Response: ' + res.body);

      bool status = result['status'];
      if (status) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('login_state', '1');
        prefs.setString('company_id', result['company_id']);
        prefs.setString('company_name', result['company_name']);
        prefs.setString('first_name', result['first_name']);
        prefs.setString('last_name', result['last_name']);
        prefs.setString('user_id', result['user_id']);
        prefs.setString('user_role', result['user_role']);

        if (result['user_role'] == '0') {
          // TODO: Implement the logic for user role '0'
        } else {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LayoutBuilder(
              builder: (context, constraints) {
                return HomePage();
              },
            )),
          );
        }
        return true;
      } else {
        Navigator.of(context).pop();
        if (result['message'] == "User not found") {
          snackBar(context, "User not found", Colors.redAccent);
        } else {
          snackBar(context, result['message'], Colors.redAccent);
        }
      }
    } else {
      snackBar(context, "Error", Colors.redAccent);
      return false;
    }

    return false; // Default return false if login fails
  }


  void snackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                //Logo
                Image.asset('images/login.png'),

                SizedBox(
                  height: 50,
                ),

                //Welcome Back Text
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: const Text(
                    'Welcome Back, You\'ve been missed!!',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      //UserID TextField
                      TextField(
                        controller: userIdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'UserID',
                          errorText: userIdValidate ? 'Value Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Username TextField
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          errorText: userNameValidate ? 'Value Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Password TextField
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          errorText: passwordValidate ? 'Value Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Login Button
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            userIdController.text.isEmpty ? userIdValidate = true : userIdValidate = false;
                            usernameController.text.isEmpty ? userNameValidate = true : userNameValidate = false;
                            passwordController.text.isEmpty ? passwordValidate = true : passwordValidate = false;
                          });
                          if (!userIdValidate && !userNameValidate && !passwordValidate) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            login(
                              context,
                              userIdController.text.trim(),
                              usernameController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        minWidth: 150.0,
                        height: 50.0,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

