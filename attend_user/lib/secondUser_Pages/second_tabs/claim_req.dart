// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// import '../../methods/methods.dart';
//
// class SecClaimReq extends StatefulWidget {
//   const SecClaimReq({Key? key}) : super(key: key);
//
//   @override
//   State<SecClaimReq> createState() => _SecClaimReqState();
// }
//
// class _SecClaimReqState extends State<SecClaimReq> {
//
//   String selectedClaimType = '';
//   final desController = TextEditingController();
//   String uploadedFilePath = '';
//
//   final List<String> _claimTypes = [
//     'Claim Type 1',
//     'Claim Type 2',
//     'Claim Type 3',
//     'Claim Type 4',
//     'Claim Type 5',
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: getSizeBoxHeight(context),
//           ),
//
//           //Claim Type Text
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 0.0),
//                 margin: const EdgeInsets.only(left: 10.0),
//                 child: const Text(
//                   'Claim Type :',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(
//             height: getSizeBoxHeight(context),
//           ),
//
//           //Claim type drop down box..
//           Row(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 20),
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 width: 320,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[350], // Change the color to your desired color
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(
//                           0.5), // Change the shadow color if needed
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(
//                           0, 3), // Adjust the offset for the drop shadow
//                     ),
//                   ],
//                 ),
//                 child: DropdownButton<String>(
//                   value:
//                   selectedClaimType.isNotEmpty ? selectedClaimType : null,
//                   hint: const Text('Select Claim Type'),
//                   onChanged: ( value) {
//                     setState(() {
//                       selectedClaimType = value ?? '';
//                     });
//                   },
//                   items: _claimTypes.map((String claimType) {
//                     return DropdownMenuItem<String>(
//                       value: claimType,
//                       child: Text(claimType),
//                     );
//                   }).toList(),
//
//
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(
//             height: getSizeBoxHeightL(context),
//           ),
//
//           //Description Text
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 0.0),
//                 margin: const EdgeInsets.only(left: 10.0),
//                 child: const Text(
//                   'Description :',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: TextFormField(
//               controller: desController,
//               keyboardType: TextInputType.multiline,
//               maxLines: 3,
//               decoration: const InputDecoration(
//                 hintText: 'Enter your description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 0.0),
//                 margin: const EdgeInsets.only(left: 10.0,top: 5.0),
//                 child: const Text(
//                   'Upload Document :',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(
//             height: getSizeBoxHeight(context),
//           ),
//
//           ElevatedButton.icon(
//             onPressed: () async {
//               FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//               if (result != null) {
//                 PlatformFile file = result.files.first;
//                 setState(() {
//                   uploadedFilePath = file.path ?? '';
//                 });
//
//                 print('File path: ${file.path}');
//                 print('File name: ${file.name}');
//                 print('File size: ${file.size}');
//               } else {
//                 // User canceled the file picker
//               }
//             },
//             icon: const Icon(
//               Icons.cloud_upload,
//               color: Colors.red,
//             ),
//             label: const Text(
//               'Upload',
//               style: TextStyle(color: Colors.black),
//             ),
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.all(16.0), backgroundColor: Colors.grey[350],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ), // Background color
//             ),
//           ),
//           if (uploadedFilePath.isNotEmpty) // Display the uploaded file path if available
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text('Uploaded File: $uploadedFilePath'),
//             ),
//
//           SizedBox(
//             height: getSizeBoxHeightL(context),
//           ),
//
//
//           ElevatedButton(
//             onPressed: () {
//               print('Claim Type: $selectedClaimType');
//               print('Note: $desController');
//             },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white, backgroundColor: Colors.black, // Sets the text color
//               minimumSize: const Size(150, 50), // Sets the minimum size of the button
//             ),
//             child: const
//             Text('Request',
//
//               style: TextStyle(fontSize: 18,),),
//           )
//
//
//
//
//
//         ],
//       ),
//     );
//   }
// }
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SecClaimReq extends StatefulWidget {
  const SecClaimReq({Key? key}) : super(key: key);

  @override
  State<SecClaimReq> createState() => _SecClaimReqState();
}

class _SecClaimReqState extends State<SecClaimReq> {
  String uploadedFilePath = '';
  List<Map<String, dynamic>> data = [
    {"Claim": "Travelling", "Amount": '', "Uploads": "Upload", "checked": false},
    {"Claim": "Telephone", "Amount": '', "Uploads": "Upload", "checked": false},
    {"Claim": "Claim 3", "Amount": '', "Uploads": "Upload", "checked": false},
    {"Claim": "Claim 4", "Amount": '', "Uploads": "Upload", "checked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Claim'),
            ),
            DataColumn(
              label: Text('Amount(Rs.)'),
              numeric: true,
            ),
            DataColumn(
              label: Text('Uploads'),
            ),
          ],
          rows: List.generate(data.length, (index) {
            final item = data[index];
            return DataRow(
              cells: [
                DataCell(Text(item['Claim'])),
                DataCell(
                  TextFormField(
                    initialValue: item['Amount'].toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        data[index]['Amount'] = double.parse(value);
                      });
                    },
                  ),
                ),
                DataCell(
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
                  //
                  //     if (result != null) {
                  //       PlatformFile file = result.files.first;
                  //       setState(() {
                  //         uploadedFilePath = file.path ?? '';
                  //       });
                  //
                  //       print('File path: ${file.path}');
                  //       print('File name: ${file.name}');
                  //       print('File size: ${file.size}');
                  //     } else {
                  //       // User canceled the file picker
                  //     }
                  //     // print('Upload button pressed for ${item['Uploads']}');
                  //   },
                  //
                  //
                  //   child: Text(item['Uploads']),
                  // ),
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
                      padding: const EdgeInsets.all(4.0), backgroundColor: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ), // Background color
                    ),
                  ),
                ),
              ],
              selected: item['checked'],
              onSelectChanged: (bool? value) {
                setState(() {
                  data[index]['checked'] = value!;
                });
                debugPrint(data.toString());
              },
            );
          }),
        ),
      ),
    );
  }
}

