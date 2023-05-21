import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class PaySlipPage extends StatelessWidget {
  const PaySlipPage({Key? key}) : super(key: key);
  final double generatedSalary = 5000.0;
  final int takenLeave = 5;
  final double leaveDeduction = 100.0;

  @override
  Widget build(BuildContext context) {
    double totalSalary = generatedSalary - (takenLeave * leaveDeduction);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Payment details",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ProfilePage()));
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Month Salary',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        '\LKR ${generatedSalary.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 70.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Taken Leave',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70.0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        takenLeave.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 140.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text(
                        'This Month Salary',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140.0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        '\LKR ${totalSalary.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your PDF downloading logic here
          // Example: You can use a package like 'flutter_pdfview' to display the PDF or 'url_launcher' to open the URL in a PDF viewer.
        },
        icon: const Icon(Icons.file_download),
        label: const Text('Download PDF'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//
// import 'package:attend_user/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
//
// import '../home.dart';
//
// class PaySlipPage extends StatefulWidget {
//   const PaySlipPage({Key? key}) : super(key: key);
//
//   @override
//   _PaySlipPageState createState() => _PaySlipPageState();
// }
//
// class _PaySlipPageState extends State<PaySlipPage> {
//   final double generatedSalary = 5000.0;
//   final int takenLeave = 5;
//   final double leaveDeduction = 100.0;
//   late String pdfPath;
//
//   @override
//   void initState() {
//     super.initState();
//     downloadPDF().then((path) {
//       setState(() {
//         pdfPath = path;
//       });
//     });
//   }
//
//   Future<String> downloadPDF() async {
//     const url = 'https://example.com/pay_slip.pdf'; // Replace with your PDF URL
//     final response = await http.get(Uri.parse(url));
//
//     final dir = await getTemporaryDirectory();
//     final file = File('${dir.path}/pay_slip.pdf');
//     await file.writeAsBytes(response.bodyBytes);
//
//     return file.path;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double totalSalary = generatedSalary - (takenLeave * leaveDeduction);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Payment details",
//           style: TextStyle(color: Colors.black, fontSize: 22),
//         ),
//         leading: IconButton(
//           icon: Image.asset("images/back.png"),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Image.asset("images/pro.png"),
//             tooltip: 'View Profile',
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
//             },
//           ),
//         ],
//         elevation: 0.0,
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               margin: const EdgeInsets.all(20.0),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: const Text(
//                         'Month Salary',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         '\LKR ${generatedSalary.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 70.0),
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: const Text(
//                         'Taken Leave',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 70.0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         takenLeave.toString(),
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 140.0),
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: const Text(
//                         'This Month Salary',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 140.0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[350],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         '\LKR ${totalSalary.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           if (pdfPath != null) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PDFView(
//                   filePath: pdfPath,
//                 ),
//               ),
//             );
//           } else {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('PDF Not Available'),
//                 content: const Text('Please wait for the PDF to finish downloading.'),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//         icon: const Icon(Icons.file_download),
//         label: const Text('Download PDF'),
//       ),
//     );
//   }
//
//   getTemporaryDirectory() {}
// }
