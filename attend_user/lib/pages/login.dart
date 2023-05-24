import 'package:flutter/material.dart';

import '../home.dart';
import '../methods/methods.dart';

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
    dispose();
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
                  height: getSizeBoxHeight(context),
                ),
                //Logo
                Image.asset('images/login.png'),

                SizedBox(
                  height: getSizeBoxHeight(context),
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
                  height: getSizeBoxHeight(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizPadding(context)),
                  child: TextField(
                    controller: userIdController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(color: Colors.black45),
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: '   User ID',
                        errorText:
                        userIdValidate ? 'User Name Can\'t Be Empty' : null,
                        helperStyle: const TextStyle(color: Colors.black45)),
                  ),
                ),
                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                //Username Text field
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getHorizPadding(context)),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(color: Colors.black45),
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: '   User Name',
                        errorText:
                        userNameValidate ? 'User ID Can\'t Be Empty' : null,
                        helperStyle: const TextStyle(color: Colors.black45)),
                  ),
                ),

                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                //Password Text field
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizPadding(context)),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(getButtonRadius(context)),
                          borderSide: const BorderSide(color: Colors.black45),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: '  Password',
                        errorText:
                        passwordValidate ? 'Password Can\'t Be Empty' : null,
                        helperStyle: const TextStyle(color: Colors.black45)),
                  ),
                ),

                //Forgot?
                SizedBox(
                  height: getSizeBoxHeight(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizPadding(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                GestureDetector(
                  // onTap: (){Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => const HomePage()));},
                  onTap: () async {
                    setState(() {
                      userIdController.text.isEmpty
                          ? userIdValidate = true
                          : userIdValidate = false;

                      usernameController.text.isEmpty
                          ? userNameValidate = true
                          : userNameValidate = false;

                      passwordController.text.isEmpty
                          ? passwordValidate = true
                          : passwordValidate = false;

                    });
                    if (!userIdValidate && !userNameValidate && !passwordValidate) {
                      // Add your function here that should be executed when all validations are false
                      // For example, you can navigate to the next page or perform any other desired action.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomePage()),
                      );
                    }

                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                //or continue

                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                //Google+Apple buttons

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizPadding(context)),
                  margin:
                  const EdgeInsets.only(left: 50, bottom: 30, right: 50),
                  child: Image.asset('images/gs.png'),
                ),
                SizedBox(
                  height: getSizeBoxHeight(context),
                ),

                //Register Now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Register Now!!',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}