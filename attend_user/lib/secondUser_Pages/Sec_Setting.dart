import 'dart:io';

import 'package:attend_user/pages/help.dart';
import 'package:attend_user/pages/language.dart';
import 'package:attend_user/pages/privacy.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:attend_user/secondUser_Pages/second_home.dart';
import 'package:flutter/material.dart';

import '../pages/notification.dart';


class SecSettings extends StatefulWidget {
  const SecSettings({Key? key}) : super(key: key);

  @override
  _SecSettingsState createState() => _SecSettingsState();
}

class _SecSettingsState extends State<SecSettings> {
  File? _imageFile; // Declare the variable to hold the profile picture file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondHome()),
            );
          },
        ),

        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: _imageFile != null
                      ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(_imageFile!),
                  )
                      : const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('Dinethri Gunawardhana',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50), // Add spacing below the image

              const TextVertical(icon: Icons.account_circle_sharp, text: 'Profile Edit'),
              const TextVertical(icon: Icons.lock, text: 'Privacy'),
              const TextVertical(icon: Icons.notifications, text: 'Notifications'),
              const TextVertical(icon: Icons.language, text: 'Language'),
              const TextVertical(icon: Icons.help, text: 'Help & Support'),
            ],
          ),
        ),
      ),
    );
  }
}

class TextVertical extends StatelessWidget {
  final IconData icon;
  final String text;

  const TextVertical({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Icon(icon),
          const SizedBox(width: 20),
          Text(text),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              if (text == 'Profile Edit') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                // );
              } else if (text == 'Privacy') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PrivacyPage()),
                // );
              } else if (text == 'Notifications') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const NotificationPage()),
                // );
              } else if (text == 'Language') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LanguPage()),
                // );
              } else if (text == 'Help & Support') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HelpPage()),
                // );
              }
            },
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

