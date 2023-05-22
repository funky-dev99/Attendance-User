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
  String selectedDayPart = '';
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();

  final List<String> _leaveTypes = [
    'Leave Type 1',
    'Leave Type 2',
    'Leave Type 3',
    'Leave Type 4',
    'Leave Type 5',
  ];
  final List<String> _DayParts = [
    'DayPart 1',
    'DayPart 2',
    'DayPart 3',
  ];

  @override
  void initState() {
    fromdateController.text = ""; //set the initial value of text field
    super.initState();

    todateController.text = ""; //set the initial value of text field
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

          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0.0),
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Leave Type :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: getSizeBoxHeight(context),),

          Row(
            children: [
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
          ),
          SizedBox(
            height: getSizeBoxHeight(context),
          ),


          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0.0),
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'From Date :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          TextField(


            controller: fromdateController, //editing controller of this TextField
            decoration: const InputDecoration(

                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter Date" //label text of field
            ),
            readOnly: true,  // when true user cannot edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), //get today's date
                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if(pickedDate != null ){
                print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                print(formattedDate); //formatted date output using intl package =>  2022-07-04
                //You can format date as per your need

                setState(() {
                  fromdateController.text = formattedDate; //set foratted date to TextField value.
                });
              }else{
                print("Date is not selected");
              }
            },
          ),

          SizedBox(
            height: getSizeBoxHeight(context),
          ),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0.0),
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'To Date :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          TextField(


            controller: todateController, //editing controller of this TextField
            decoration: const InputDecoration(

                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter Date" //label text of field
            ),
            readOnly: true,  // when true user cannot edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), //get today's date
                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if(pickedDate != null ){
                print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                print(formattedDate); //formatted date output using intl package =>  2022-07-04
                //You can format date as per your need

                setState(() {
                  todateController.text = formattedDate; //set foratted date to TextField value.
                });
              }else{
                print("Date is not selected");
              }
            },
          ),

          SizedBox(
            height: getSizeBoxHeight(context),),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0.0),
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Day Part :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: getSizeBoxHeight(context),),

          Row(
            children: [
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
                  selectedDayPart.isNotEmpty ? selectedDayPart : null,
                  hint: const Text('Select Day Part'),
                  onChanged: ( value) {
                    setState(() {
                      selectedDayPart = value ?? '';
                    });
                  },
                  items: _DayParts.map((String claimType) {
                    return DropdownMenuItem<String>(
                      value: claimType,
                      child: Text(claimType),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              print('Leave Type: $selectedLeaveType');
              print('From: $fromdateController');
              print('To: $todateController');
              print('Day Part: $selectedDayPart');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.black, // Sets the text color
              minimumSize: const Size(150, 50), // Sets the minimum size of the button
            ),
            child: const
            Text('Submit',

              style: TextStyle(fontSize: 18,),),
          )


        ],
      )

    );

  }
}

