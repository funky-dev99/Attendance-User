import 'dart:io';

import 'package:attend_user/pages/privacy.dart';
import 'package:attend_user/pages/profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'notification.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/pro.png"),
            tooltip: 'View Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 60), // Add spacing below the image

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              } else if (text == 'Privacy') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()),
                );
              } else if (text == 'Notifications') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationPage()),
                );
              } else if (text == 'Language') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguagePage()),
                );
              } else if (text == 'Help & Support') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpSupportPage()),
                );
              }
            },
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

// class PrivacyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Privacy'),
//       ),
//       body: const Center(
//         child: Text('Privacy Page'),
//       ),
//     );
//   }
// }

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications Page'),
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: const Center(
        child: Text('Language Page'),
      ),
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: const Center(
        child: Text('Help & Support Page'),
      ),
    );
  }
}

