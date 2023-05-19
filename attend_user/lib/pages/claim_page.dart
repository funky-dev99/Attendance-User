import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../methods/methods.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({Key? key}) : super(key: key);

  @override
  State<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  String selectedClaimType = '';

  final List<String> _claimTypes = [
    'Claim Type 1',
    'Claim Type 2',
    'Claim Type 3',
    'Claim Type 4',
    'Claim Type 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Claim Request",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
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
      body: Column(
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
                  'Claim Type:',
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

          //Claim type drope down box..
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
                      selectedClaimType.isNotEmpty ? selectedClaimType : null,
                  hint: const Text('Select Claim Type'),
                  onChanged: (String? value) {
                    setState(() {
                      selectedClaimType = value ?? '';
                    });
                  },
                  items: _claimTypes.map((String claimType) {
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

          //Description Text
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0.0),
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
