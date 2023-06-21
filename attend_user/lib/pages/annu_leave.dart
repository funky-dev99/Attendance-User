import 'package:attend_user/pages/leave_main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../methods/methods.dart';
import 'package:file_picker/file_picker.dart';

class AnnuLeave extends StatefulWidget {
  const AnnuLeave({Key? key}) : super(key: key);

  @override
  State<AnnuLeave> createState() => _AnnuLeaveState();
}

class _AnnuLeaveState extends State<AnnuLeave> {
  String selectedLeaveType = '';
  String selectedDayPart = '';
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();
  String uploadedFilePath = '';

  // final List<String> _leaveTypes = [
  //   'Leave Type 1',
  //   'Leave Type 2',
  //   'Leave Type 3',
  //   'Leave Type 4',
  //   'Leave Type 5',
  // ];
  final List<String> _DayParts = [
    'Full Day',
    'Half Day',
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
            "Annual Leave",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          leading: IconButton(
            icon: Image.asset("images/back.png"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  LeaveMain()));
            },
          ),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: getSizeBoxHeightL(context),),

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
                      todateController.text = formattedDate; //set formatted date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              ),

              SizedBox(
                height: getSizeBoxHeightL(context),),

              // Row(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.only(left: 0.0),
              //       margin: const EdgeInsets.only(left: 10.0),
              //       child: const Text(
              //         'Day Part :',
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //
              // SizedBox(
              //   height: getSizeBoxHeight(context),),

              // Row(
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.only(left: 30),
              //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //       width: 300,
              //       decoration: BoxDecoration(
              //         color: Colors.grey[350], // Change the color to your desired color
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(
              //                 0.5), // Change the shadow color if needed
              //             spreadRadius: 2,
              //             blurRadius: 5,
              //             offset: const Offset(
              //                 0, 3), // Adjust the offset for the drop shadow
              //           ),
              //         ],
              //       ),
              //       child: DropdownButton<String>(
              //         value:
              //         selectedDayPart.isNotEmpty ? selectedDayPart : null,
              //         hint: const Text('Select Day Part'),
              //         onChanged: ( value) {
              //           setState(() {
              //             selectedDayPart = value ?? '';
              //           });
              //         },
              //         items: _DayParts.map((String claimType) {
              //           return DropdownMenuItem<String>(
              //             value: claimType,
              //             child: Text(claimType),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: getSizeBoxHeight(context),
              // ),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0.0),
                    margin: const EdgeInsets.only(left: 10.0,top: 5.0),
                    child: const Text(
                      'Upload Document :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: getSizeBoxHeight(context),
              ),

              ElevatedButton.icon(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.first;
                    setState(() {
                      uploadedFilePath = file.path ?? '';
                    });

                    print('File path: ${file.path}');
                    print('File name: ${file.name}');
                    print('File size: ${file.size}');
                  } else {
                    // User canceled the file picker
                  }
                },
                icon: const Icon(
                  Icons.cloud_upload,
                  color: Colors.red,
                ),
                label: const Text(
                  'Upload',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0), backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ), // Background color
                ),
              ),
              if (uploadedFilePath.isNotEmpty) // Display the uploaded file path if available
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Uploaded File: $uploadedFilePath'),
                ),

              SizedBox(
                height: getSizeBoxHeightL(context),
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
          ),
        )

    );

  }
}

