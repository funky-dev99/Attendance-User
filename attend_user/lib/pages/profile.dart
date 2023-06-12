// import 'package:attend_user/pages/profile_main.dart';
// import 'package:attend_user/pages/setting.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import '../home.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   bool isObscurePassword = true;
//   File? _imageFile;
//   String? id;
//   String? fullName;
//   String? email;
//   String? password;
//
//   Future<void> _pickImage() async {
//     final pickedImage =
//     await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setState(() {
//         _imageFile = File(pickedImage.path);
//       });
//     }
//   }
//
//   void submitForm() {
//     print('ID: $id');
//     print('Full Name: $fullName');
//     print('Email: $email');
//     print('Password: $password');
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfileMainPage(
//           id: id ?? '',
//           fullName: fullName ?? '',
//           email: email ?? '',
//           password: password ?? '',
//         ),
//       ),
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Profile Edit",
//           style: TextStyle(color: Colors.black, fontSize: 22),
//         ),
//         leading: IconButton(
//           icon: Image.asset("images/back.png"),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           },
//         ),
//         elevation: 0.0,
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 4, color: Colors.white),
//                         boxShadow: [
//                           BoxShadow(
//                             spreadRadius: 2,
//                             blurRadius: 10,
//                             color: Colors.black.withOpacity(0.1),
//                           )
//                         ],
//                         shape: BoxShape.circle,
//                         image: _imageFile != null
//                             ? DecorationImage(
//                           fit: BoxFit.cover,
//                           image: FileImage(_imageFile!),
//                         )
//                             : const DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                               'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: _pickImage,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 4, color: Colors.white),
//                             color: Colors.blue,
//                           ),
//                           child: const Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               buildTextField("ID", "Enter ID Number", false, 18),
//               buildTextField("Full Name", "Enter Full Name", false, 18),
//               buildTextField("Email", "Enter Your Email", false, 18),
//               buildTextField("Password", "Enter Password", true, 18),
//               const SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: const Text("Cancel",
//                         style: TextStyle(
//                             fontSize: 15,
//                             letterSpacing: 2,
//                             color: Colors.white)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: submitForm,
//                     child: const Text("Submit",
//                         style: TextStyle(
//                             fontSize: 15,
//                             letterSpacing: 2,
//                             color: Colors.white)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(
//       String labelText,
//       String placeholder,
//       bool isPasswordTextField,
//       double fontSize,
//       ) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30),
//       child: TextField(
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         onChanged: (value) {
//           setState(() {
//             switch (labelText) {
//               case "ID":
//                 id = value;
//                 break;
//               case "Full Name":
//                 fullName = value;
//                 break;
//               case "Email":
//                 email = value;
//                 break;
//               case "Password":
//                 password = value;
//                 break;
//             }
//           });
//         },
//         decoration: InputDecoration(
//           suffixIcon: isPasswordTextField
//               ? IconButton(
//             icon: isObscurePassword
//                 ? const Icon(
//               Icons.visibility_off,
//               color: Colors.grey,
//             )
//                 : const Icon(
//               //Icons.visibility_off,
//               Icons.remove_red_eye,
//               color: Colors.grey,
//             ),
//             onPressed: () {
//               setState(() {
//                 isObscurePassword = !isObscurePassword;
//               });
//             },
//           )
//               : null,
//           contentPadding: const EdgeInsets.only(bottom: 5),
//           labelText: labelText,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           hintText: placeholder,
//           hintStyle: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//           labelStyle: const TextStyle(
//             fontSize: 20, // font size
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:attend_user/pages/profile_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../home.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isObscurePassword = true;
  File? _imageFile;
  String? id;
  String? fullName;
  String? email;
  String? password;

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void submitForm() {
    print('ID: $id');
    print('Full Name: $fullName');
    print('Email: $email');
    print('Password: $password');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileMainPage(
          id: id ?? '',
          fullName: fullName ?? '',
          email: email ?? '',
          password: password ?? '',
          imageFile: _imageFile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile Edit",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField("ID", "Enter ID Number", false, 18),
              buildTextField("Full Name", "Enter Full Name", false, 18),
              buildTextField("Email", "Enter Your Email", false, 18),
              buildTextField("Password", "Enter Password", true, 18),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Cancel",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: const Text("Submit",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholder,
      bool isPasswordTextField,
      double fontSize,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        onChanged: (value) {
          setState(() {
            switch (labelText) {
              case "ID":
                id = value;
                break;
              case "Full Name":
                fullName = value;
                break;
              case "Email":
                email = value;
                break;
              case "Password":
                password = value;
                break;
            }
          });
        },
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
            icon: isObscurePassword
                ? const Icon(
              Icons.visibility_off,
              color: Colors.grey,
            )
                : const Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            },
          )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
