// import 'package:attend_user/secondUser_Pages/sec_leave_main.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import 'package:file_picker/file_picker.dart';
//
// import '../../methods/methods.dart';
//
// class SickLeave extends StatefulWidget {
//   SickLeave({Key? key}) : super(key: key);
//
//   @override
//   State<SickLeave> createState() => _SickLeaveState();
// }
//
// class _SickLeaveState extends State<SickLeave> {
//   String selectedLeaveType = 'Medical Leave';
//   String selectedDayPart = '';
//   TextEditingController fromdateController = TextEditingController();
//   TextEditingController todateController = TextEditingController();
//   String uploadedFilePath = '';
//   String leaveTypeCode = '4';
//
//
//   @override
//   void initState() {
//     fromdateController.text = ""; //set the initial value of text field
//     super.initState();
//
//     todateController.text = ""; //set the initial value of text field
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text(
//             "Medical Leave",
//             style: TextStyle(color: Colors.black, fontSize: 22),
//           ),
//           leading: IconButton(
//             icon: Image.asset("images/back.png"),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) =>  SecLeaveMain()));
//             },
//           ),
//           elevation: 0.0,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: getSizeBoxHeightL(context),),
//
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 0.0),
//                     margin: const EdgeInsets.only(left: 10.0),
//                     child: const Text(
//                       'From Date :',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               TextField(
//
//
//                 controller: fromdateController, //editing controller of this TextField
//                 decoration: const InputDecoration(
//
//                     icon: Icon(Icons.calendar_today), //icon of text field
//                     labelText: "Enter Date" //label text of field
//                 ),
//                 readOnly: true,  // when true user cannot edit text
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(), //get today's date
//                       firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101)
//                   );
//
//                   if(pickedDate != null ){
//                     print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
//                     String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
//                     print(formattedDate); //formatted date output using intl package =>  2022-07-04
//                     //You can format date as per your need
//
//                     setState(() {
//                       fromdateController.text = formattedDate; //set foratted date to TextField value.
//                     });
//                   }else{
//                     print("Date is not selected");
//                   }
//                 },
//               ),
//
//               SizedBox(
//                 height: getSizeBoxHeight(context),
//               ),
//
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 0.0),
//                     margin: const EdgeInsets.only(left: 10.0),
//                     child: const Text(
//                       'To Date :',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               TextField(
//
//
//                 controller: todateController, //editing controller of this TextField
//                 decoration: const InputDecoration(
//
//                     icon: Icon(Icons.calendar_today), //icon of text field
//                     labelText: "Enter Date" //label text of field
//                 ),
//                 readOnly: true,  // when true user cannot edit text
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(), //get today's date
//                       firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101)
//                   );
//
//                   if(pickedDate != null ){
//                     print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
//                     String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
//                     print(formattedDate); //formatted date output using intl package =>  2022-07-04
//                     //You can format date as per your need
//
//                     setState(() {
//                       todateController.text = formattedDate; //set formatted date to TextField value.
//                     });
//                   }else{
//                     print("Date is not selected");
//                   }
//                 },
//               ),
//
//               SizedBox(
//                 height: getSizeBoxHeightL(context),),
//
//
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 0.0),
//                     margin: const EdgeInsets.only(left: 10.0,top: 5.0),
//                     child: const Text(
//                       'Upload Document :',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(
//                 height: getSizeBoxHeight(context),
//               ),
//
//               ElevatedButton.icon(
//                 onPressed: () async {
//                   FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//                   if (result != null) {
//                     PlatformFile file = result.files.first;
//                     setState(() {
//                       uploadedFilePath = file.path ?? '';
//                     });
//
//                     // print('File path: ${file.path}');
//                     // print('File name: ${file.name}');
//                     // print('File size: ${file.size}');
//                   } else {
//                     // User canceled the file picker
//                   }
//                 },
//                 icon: const Icon(
//                   Icons.cloud_upload,
//                   color: Colors.red,
//                 ),
//                 label: const Text(
//                   'Upload',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(16.0), backgroundColor: Colors.grey[350],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ), // Background color
//                 ),
//               ),
//               if (uploadedFilePath.isNotEmpty) // Display the uploaded file path if available
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Text('Uploaded File: $uploadedFilePath'),
//                 ),
//
//               SizedBox(
//                 height: getSizeBoxHeightL(context),
//               ),
//
//
//               ElevatedButton(
//                 onPressed: () {
//                   print('Leave Type: $selectedLeaveType');
//                   print('From: $fromdateController');
//                   print('To: $todateController');
//                   print('Uploaded File: $uploadedFilePath');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.black, // Sets the text color
//                   minimumSize: const Size(150, 50), // Sets the minimum size of the button
//                 ),
//                 child: const
//                 Text('Submit',
//
//                   style: TextStyle(fontSize: 18,),),
//               )
//
//
//             ],
//           ),
//         )
//
//     );
//
//   }
// }
//
import 'package:talent/secondUser_Pages/sec_leave_main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import '../../methods/methods.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class SickLeave extends StatefulWidget {
  SickLeave({Key? key}) : super(key: key);

  @override
  State<SickLeave> createState() => _SickLeaveState();
}

class _SickLeaveState extends State<SickLeave> {
  String selectedLeaveType = 'Medical Leave';
  String selectedDayPart = '';
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();
  String uploadedFilePath = '';
  String leaveTypeCode = '4';
  String leaveTypeName = 'Medical';
  String companyId = '1234';
  String companyName = '111';
  String userId = '111';
  String userName = '12345';


  @override
  void initState() {
    fromdateController.text = "";
    todateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Medical Leave",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecLeaveMain()),
            );
          },
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: getSizeBoxHeightL(context)),
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
              controller: fromdateController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Enter Date",
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    fromdateController.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            SizedBox(height: getSizeBoxHeight(context)),
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
              controller: todateController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Enter Date",
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    todateController.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            SizedBox(height: getSizeBoxHeightL(context)),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0.0),
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
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
            SizedBox(height: getSizeBoxHeight(context)),
            ElevatedButton.icon(
              onPressed: () async {
                FilePickerResult? result =
                await FilePicker.platform.pickFiles();

                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    uploadedFilePath = file.path ?? '';
                  });
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
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.grey[350],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            if (uploadedFilePath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Uploaded File: $uploadedFilePath'),
              ),
            SizedBox(height: getSizeBoxHeightL(context)),
            ElevatedButton(
              onPressed: () async {
                print('Leave Type: $selectedLeaveType');
                print('From: ${fromdateController.text}');
                print('To: ${todateController.text}');
                print('Uploaded File: $uploadedFilePath');

                bool success = await createLeaveRequest(
                  context,
                  companyId,
                  companyName,
                  userId,
                  userName,
                  leaveTypeCode,
                  leaveTypeName,
                  fromdateController.text,
                  todateController.text,
                  '',
                  '',
                  '',
                  '',
                  '',
                );

                if (success) {
                  // Show success message or navigate to another screen
                  Future.delayed(Duration(milliseconds: 500), () {
                    snackBar(context, "Leave request submitted successfully", Colors.green);
                  });
                } else {
                  // Show error message
                  Future.delayed(Duration(milliseconds: 500), () {
                    snackBar(context, "Failed to submit leave request", Colors.redAccent);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: const Size(150, 50),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> getLeaveUnicId() async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int unicLeaveId = timestamp;
    return unicLeaveId;
  }

  Future<bool> createLeaveRequest(
      BuildContext context,
      var companyId,
      var companyName,
      var userId,
      var userName,
      var leaveTypeCode,
      var leaveTypeName,
      var fromDate,
      var toDate,
      var reason,
      var leaveStatus,
      var deleteRow,
      var deleteById,
      var updateById,
      ) async {
    var url = "http://api.talent.cbs.lk/createLeaveRequest.php";
    var leaveUnicId = await getLeaveUnicId();
    var data = {
      "leave_request_id": '$leaveUnicId',
      "company_id": '$companyId',
      "company_name": '$companyName',
      "user_id": '$userId',
      "user_name": '$userName',
      "leave_type_code": '$leaveTypeCode',
      "leave_type_name": '$leaveTypeName',
      "from_date": '$fromDate',
      "to_date": '$toDate',
      "reason": '$reason',
      "leave_status": '$leaveStatus',
      "delete_row": '$deleteRow',
      "delete_by_id": '$deleteById',
      "update_by_id": '$updateById',
    };

    http.Response res = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
      },
    );

    var response = json.decode(res.body);
    print(response);
    if (response['error'] == 'false') {
      snackBar(context, "Done", Colors.green); // Show success snackbar
      return true;
    } else {
      snackBar(context, "Error", Colors.redAccent); // Show error snackbar
      return false;
    }
  }

  void snackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }
}

