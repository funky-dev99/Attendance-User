import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../methods/methods.dart';
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
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
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
                          'Leave Balance',
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
                        decoration: BoxDecoration(
                          color: Colors.grey[350], // Change the color to your desired color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Change the shadow color if needed
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0), // Customize the padding as per your requirements
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sick',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
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
                        decoration: BoxDecoration(
                          color: Colors.grey[350], // Change the color to your desired color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Change the shadow color if needed
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0), // Customize the padding as per your requirements
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Vacation',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
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
                        decoration: BoxDecoration(
                          color: Colors.grey[350], // Change the color to your desired color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Change the shadow color if needed
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0), // Customize the padding as per your requirements
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Annual Leave',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
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
                        decoration: BoxDecoration(
                          color: Colors.grey[350], // Change the color to your desired color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Change the shadow color if needed
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0), // Customize the padding as per your requirements
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Holiday',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
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

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0), // Customize the paddings as per your requirements
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Leave()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // Sets the text color
                    minimumSize: const Size(150, 50), // Sets the minimum size of the button
                  ),
                  child: const Text(
                    'Request',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
