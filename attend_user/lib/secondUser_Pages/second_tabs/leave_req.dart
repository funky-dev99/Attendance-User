import 'package:attend_user/secondUser_Pages/leave_req/annual_req.dart';
import 'package:attend_user/secondUser_Pages/leave_req/cassual_req.dart';
import 'package:attend_user/secondUser_Pages/leave_req/half_req.dart';
import 'package:attend_user/secondUser_Pages/leave_req/sick_req.dart';
import 'package:flutter/material.dart';

import '../../methods/methods.dart';

class SecLeaveReq extends StatefulWidget {
  const SecLeaveReq({Key? key}) : super(key: key);

  @override
  State<SecLeaveReq> createState() => _SecLeaveReqState();
}

class _SecLeaveReqState extends State<SecLeaveReq> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getSizeBoxHeight(context)),

                //Claim Type Text
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 0.0),
                      margin: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        'Leave Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: getSizeBoxHeightL(context)),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: 300,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SickLeave()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[350], // Sets the text color
                          minimumSize: const Size(150, 50), // Sets the minimum size of the button
                        ),
                        child: const Text(
                          'Sick / Medical',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSizeBoxHeight(context)),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: 300,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecCasualLeave()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[350], // Sets the text color
                          minimumSize: const Size(150, 50), // Sets the minimum size of the button
                        ),
                        child: const Text(
                          'Casual Leave',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSizeBoxHeight(context)),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: 300,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecAnnuLeave()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[350], // Sets the text color
                          minimumSize: const Size(150, 50), // Sets the minimum size of the button
                        ),
                        child: const Text(
                          'Annual Leave',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSizeBoxHeight(context)),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: 300,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecHalflLeave()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[350], // Sets the text color
                          minimumSize: const Size(150, 50), // Sets the minimum size of the button
                        ),
                        child: const Text(
                          'Half Day',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
