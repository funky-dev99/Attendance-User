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

  void addNewColumn() {
    setState(() {
      data.add({
        "Claim": "New Claim",
        "Amount": '',
        "Uploads": "Upload",
        "checked": false,
      });
    });
  }

  void submitItems() {
    List<Map<String, dynamic>> selectedItems = data.where((item) => item['checked']).toList();
    print(selectedItems);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                    DataCell(
                      TextFormField(
                        initialValue: item['Claim'].toString(),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            data[index]['Claim'] = value;
                          });
                        },
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        initialValue: item['Amount'].toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            data[index]['Amount'] = value;
                          });
                        },
                      ),
                    ),
                    DataCell(
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
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(4.0),
                          backgroundColor: Colors.grey[350],
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
        ),
        ElevatedButton(
          onPressed: addNewColumn,
          child: const Icon(Icons.add),
        ),
        ElevatedButton(
          onPressed: submitItems,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

