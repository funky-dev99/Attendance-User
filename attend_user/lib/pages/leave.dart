import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../home.dart';
import '../methods/methods.dart';

class Leave extends StatefulWidget {
  Leave({Key? key}) : super(key: key);

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  String selectedLeaveType = '';
  TextEditingController dateController = TextEditingController();

  final List<String> _leaveTypes = [
    'Leave Type 1',
    'Leave Type 2',
    'Leave Type 3',
    'Leave Type 4',
    'Leave Type 5',
  ];

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Leave Request",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  HomePage()));
          },
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
          height: getSizeBoxHeight(context),),

          Container(
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: 220,
            decoration: BoxDecoration(
              color: Colors.grey, // Change the color to your desired color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(
                      0.5), // Change the shadow color if needed
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(
                      0, 3), // Adjust the offset for the drop shadow
                ),
              ],
            ),
            child: DropdownButton<String>(
              value:
              selectedLeaveType.isNotEmpty ? selectedLeaveType : null,
              hint: const Text('Select Leave Type'),
              onChanged: ( value) {
                setState(() {
                  selectedLeaveType = value ?? '';
                });
              },
              items: _leaveTypes.map((String claimType) {
                return DropdownMenuItem<String>(
                  value: claimType,
                  child: Text(claimType),
                );
              }).toList(),
            ),
          ),


        ],
      )

    );

  }
}

