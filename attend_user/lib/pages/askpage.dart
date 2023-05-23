import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../methods/methods.dart';

class AskPage extends StatefulWidget {
  const AskPage({Key? key}) : super(key: key);

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  String selectedDesignation = '';
  final subjectController = TextEditingController();
  final desController = TextEditingController();

  final List<String> _designations = [
    'Designation 1',
    'Designation 2',
    'Designation 3',
    'Designation 4',
    'Designation 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Ask Anything",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  const HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getSizeBoxHeight(context),
            ),

            //Claim Type Text
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0.0),
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    'Designation :',
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

            //Claim type drop down box..
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.grey[350], // Change the color to your desired color
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
                    selectedDesignation.isNotEmpty ? selectedDesignation : null,
                    hint: const Text('Select Designation'),
                    onChanged: ( value) {
                      setState(() {
                        selectedDesignation = value ?? '';
                      });
                    },
                    items: _designations.map((String designations) {
                      return DropdownMenuItem<String>(
                        value: designations,
                        child: Text(designations),
                      );
                    }).toList(),


                  ),
                ),
              ],
            ),
            SizedBox(
              height: getSizeBoxHeightL(context),
            ),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0.0),
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    'Subject :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),


            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: subjectController,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Enter the subject',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Description Text
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0.0),
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    'Description :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),


            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: desController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter your description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(
              height: getSizeBoxHeightL(context),
            ),

            ElevatedButton(
              onPressed: () {
                print('Designation: $selectedDesignation');
                print('Subject: $subjectController');
                print('Note: $desController');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Sets the text color
                minimumSize: const Size(150, 50), // Sets the minimum size of the button
              ),
              child: const
              Text('Send',

                style: TextStyle(fontSize: 18,),),
            )




          ],
        ),
      ),
    );
  }
}
