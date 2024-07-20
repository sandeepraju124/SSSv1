// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

// ignore_for_file: prefer_const_constructors

import "dart:io";
import 'package:image_picker/image_picker.dart';
import "package:flutter/material.dart";
import "package:sssv1/providers/user_provider.dart";
import "package:sssv1/utils/constants.dart";
import "package:provider/provider.dart";
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import "package:sssv1/utils/success_lottiejson.dart";

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// bool editing = false;
// File? _changedDp;

// Map<String, String> updatedData = {};

// class _EditProfileState extends State<EditProfile> {
//   Future imagePicker(ImageSource source) async {
//     ImagePicker pick = ImagePicker();
//     final pickedFile = await pick.pickImage(source: source);
//     setState(() {
//       _changedDp = File(pickedFile!.path);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("edit profile widget called");
//     var data = Provider.of<UserProvider>(context);
//     Future<void> updateData() async {
//       final user = FirebaseAuth.instance.currentUser;
//       final userid = user?.uid;
//       final Uri url = Uri.parse("$baseUrl/user/$userid");

//       try {
//         final request = http.MultipartRequest('PUT', url);
//         // request.headers['Content-Type'] = 'application/json';
//         if (_changedDp != null) {
//           request.files
//               .add(await http.MultipartFile.fromPath('dp', _changedDp!.path));
//         }
//         request.fields.addAll(updatedData);
//         // send the request
//         var response = await request.send();

//         if (response.statusCode == 200) {
//           print('User updated successfully');
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => lottie()),
//           );

//           // Pop back to the previous screen after a delay (optional)
//           Future.delayed(Duration(seconds: 2), () {
//             Navigator.pop(context);
//             setState(() {
//               editing = false;
//             });
//           });
//           await data.userProvider();
//         } else if (response.statusCode == 404) {
//           print('User not found');
//         } else {
//           print('Failed to update user. Status code: ${response.statusCode}');
//         }
//       } catch (e) {
//         print("Exception Occurred $e");
//       }
//     }

//     TextEditingController _textEditingControllerName =
//         TextEditingController(text: data.getUserData!.name.toString());
//     TextEditingController _textEditingControllerUserName =
//         TextEditingController(text: data.getUserData!.username.toString());
//     TextEditingController _textEditingControllerPhone =
//         TextEditingController(text: data.getUserData!.name.toString());
//     TextEditingController _textEditingControllerEmail =
//         TextEditingController(text: data.getUserData!.email.toString());

//     // Listen for changes in the text fields and if there any change add to empty map

//     _textEditingControllerName.addListener(() {
//       updatedData['name'] = _textEditingControllerName.text;
//     });

//     _textEditingControllerUserName.addListener(() {
//       updatedData['username'] = _textEditingControllerUserName.text;
//     });

//     _textEditingControllerPhone.addListener(() {
//       updatedData['phone'] = _textEditingControllerPhone.text;
//     });

// // _textEditingControllerEmail.addListener(() {
// //   updatedData['email'] = _textEditingControllerEmail.text;
// // });

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           "EDIT PROFILE",
//           style: TextStyle(color: Colors.grey),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 90,
//                 width: double.infinity,
//                 color: secondaryColor10LightTheme,
//                 // color: Colors.deepOrangeAccent,
//                 child: Stack(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         imagePicker(ImageSource.gallery);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             // image: DecorationImage(
//                             //   image: _changedDp != null
//                             //       ? FileImage(_changedDp!)
//                             //       : NetworkImage(data.getUserData!.dp)
//                             //           as ImageProvider,
//                             //   fit: BoxFit.contain,
//                             // ),
//                             color: Colors.grey,
//                             shape: BoxShape.circle),
//                       ),
//                     ),
//                     Positioned(
//                       // left: 0,
//                       // bottom: 0,
//                       top: 59,
//                       right: 150,
//                       child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(100)),
//                           padding: EdgeInsets.all(3),
//                           child: Icon(Icons.camera_enhance_outlined,
//                               size: 15, color: Colors.black)),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 14,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     editing = !editing;
//                   });
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   width: double.infinity,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey)),
//                   child: Text("Edit Profile"),
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 55,
//                       margin: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: TextField(
//                         style: TextStyle(
//                             color: editing ? Colors.black : Colors.grey),
//                         controller: _textEditingControllerName,
//                         enabled: editing,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.all(10.0),
//                           labelText: "Name",
//                           hintText: "Enter your name",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 55,
//                       margin: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: TextField(
//                         style: TextStyle(
//                             color: editing ? Colors.black : Colors.grey),
//                         controller: _textEditingControllerUserName,
//                         enabled: editing,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.all(10.0),
//                           labelText: "Username",
//                           hintText: "Enter your name",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 55,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 child: TextField(
//                   keyboardType: TextInputType.phone,
//                   style: TextStyle(color: editing ? Colors.black : Colors.grey),
//                   controller: _textEditingControllerPhone,
//                   enabled: editing,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(10.0),
//                     labelText: "Phone",
//                     hintText: "phone",
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 55,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 child: TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(color: editing ? Colors.black : Colors.grey),
//                   controller: _textEditingControllerEmail,
//                   enabled: false,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(10.0),
//                     labelText: "Email",
//                     hintText: "Enter your name",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: InkWell(
//         onTap: () async {
//           // print(_textEditingControllerName.text);
//           updateData();
//           print(updatedData);
//         },
//         child: Container(
//           height: 55,
//           width: double.infinity,
//           color: tgAccentColor,
//           child: Center(
//               child: Text(
//             "UPDATE",
//             style: TextStyle(
//                 color: editing ? Colors.white : Colors.grey, fontSize: 17),
//           )),
//         ),
//       ),
//     );
//   }
// }



// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// bool editing = false;
// File? _changedDp;
// Map<String, String> updatedData = {};

// class _EditProfileState extends State<EditProfile> {
//   Future imagePicker(ImageSource source) async {
//     ImagePicker pick = ImagePicker();
//     final pickedFile = await pick.pickImage(source: source);
//     setState(() {
//       _changedDp = File(pickedFile!.path);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<UserProvider>(context);
    
//     Future<void> updateData() async {
//       final user = FirebaseAuth.instance.currentUser;
//       final userid = user?.uid;
//       final Uri url = Uri.parse("$baseUrl/user/$userid");

//       try {
//         final request = http.MultipartRequest('PUT', url);
//         if (_changedDp != null) {
//           request.files.add(await http.MultipartFile.fromPath('dp', _changedDp!.path));
//         }
//         request.fields.addAll(updatedData);
//         var response = await request.send();

//         if (response.statusCode == 200) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => lottie()),
//           );
//           Future.delayed(Duration(seconds: 2), () {
//             Navigator.pop(context);
//             setState(() {
//               editing = false;
//             });
//           });
//           await data.userProvider();
//         } else if (response.statusCode == 404) {
//           print('User not found');
//         } else {
//           print('Failed to update user. Status code: ${response.statusCode}');
//         }
//       } catch (e) {
//         print("Exception Occurred $e");
//       }
//     }

//     TextEditingController _textEditingControllerName =
//         TextEditingController(text: data.getUserData!.name.toString());
//     TextEditingController _textEditingControllerUserName =
//         TextEditingController(text: data.getUserData!.username.toString());
//     // TextEditingController _textEditingControllerPhone =
//         // TextEditingController(text: data.getUserData!.phone.toString());
//     TextEditingController _textEditingControllerPhone =
//         TextEditingController(text: "9912277968");
//     TextEditingController _textEditingControllerEmail =
//         TextEditingController(text: data.getUserData!.email.toString());

//     _textEditingControllerName.addListener(() {
//       updatedData['name'] = _textEditingControllerName.text;
//     });

//     _textEditingControllerUserName.addListener(() {
//       updatedData['username'] = _textEditingControllerUserName.text;
//     });

//     // _textEditingControllerPhone.addListener(() {
//     //   updatedData['phone'] = _textEditingControllerPhone.text;
//     // });

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           "EDIT PROFILE",
//           style: TextStyle(color: Colors.grey),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Container(
//                 height: 90,
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           imagePicker(ImageSource.gallery);
//                         },
//                         child: CircleAvatar(
//                           radius: 40,
//                           // backgroundImage: _changedDp != null
//                           //     ? FileImage(_changedDp!)
//                           //     : NetworkImage(data.getUserData!.dp) as ImageProvider,
//                           child: Align(
//                             alignment: Alignment.bottomRight,
//                             child: CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 12,
//                               child: Icon(
//                                 Icons.camera_enhance,
//                                 size: 16,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 14),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     editing = !editing;
//                   });
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   width: double.infinity,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey)),
//                   child: Text("Edit Profile"),
//                 ),
//               ),
//               SizedBox(height: 4),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 55,
//                       margin: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: TextField(
//                         style: TextStyle(
//                             color: editing ? Colors.black : Colors.grey),
//                         controller: _textEditingControllerName,
//                         enabled: editing,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.all(10.0),
//                           labelText: "Name",
//                           hintText: "Enter your name",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 55,
//                       margin: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: TextField(
//                         style: TextStyle(
//                             color: editing ? Colors.black : Colors.grey),
//                         controller: _textEditingControllerUserName,
//                         enabled: editing,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.all(10.0),
//                           labelText: "Username",
//                           hintText: "Enter your username",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 55,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 child: TextField(
//                   keyboardType: TextInputType.phone,
//                   style: TextStyle(color: editing ? Colors.black : Colors.grey),
//                   controller: _textEditingControllerPhone,
//                   enabled: editing,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(10.0),
//                     labelText: "Phone",
//                     hintText: "Enter your phone number",
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 55,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 child: TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(color: editing ? Colors.black : Colors.grey),
//                   controller: _textEditingControllerEmail,
//                   enabled: false,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.all(10.0),
//                     labelText: "Email",
//                     hintText: "Enter your email",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: InkWell(
//         onTap: () async {
//           updateData();
//         },
//         child: Container(
//           height: 55,
//           width: double.infinity,
//           color: Colors.blueAccent,
//           child: Center(
//               child: Text(
//             "UPDATE",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 17),
//           )),
//         ),
//       ),
//     );
//   }
// }



// -----------------------------------------------------------------



class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool editing = false;
  File? _changedDp;
  Map<String, String> updatedData = {};

  Future<void> imagePicker(ImageSource source) async {
    final ImagePicker pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _changedDp = File(pickedFile.path);
      });
    }
  }

  // Future<void> updateData() async {
  //     final user = FirebaseAuth.instance.currentUser;
  //     final userid = user?.uid;
  //     // final Uri url = Uri.parse("$baseUrl/user/$userid");
  //     final Uri url = Uri.parse("$baseUrl/user");

  //     try {
  //       final request = http.MultipartRequest('PUT', url);
  //       // request.headers['Content-Type'] = 'application/json';
  //       if (_changedDp != null) {
  //         request.files
  //             .add(await http.MultipartFile.fromPath('dp', _changedDp!.path));
  //       }
  //       request.fields.addAll(updatedData);
  //       // send the request
  //       var response = await request.send();

  //       if (response.statusCode == 200) {
  //         print('User updated successfully');
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => lottie()),
  //         );

  //         // Pop back to the previous screen after a delay (optional)
  //         Future.delayed(Duration(seconds: 2), () {
  //           Navigator.pop(context);
  //           setState(() {
  //             editing = false;
  //           });
  //         });
  //         // await data.userProvider();
  //       } else if (response.statusCode == 404) {
  //         print('User not found');
  //       } else {
  //         print('Failed to update user. Status code: ${response.statusCode}');
  //       }
  //     } catch (e) {
  //       print("Exception Occurred $e");
  //     }
  //   }

  Future<bool> updateData() async {
  final user = FirebaseAuth.instance.currentUser;
  final userid = user?.uid;
  final Uri url = Uri.parse("$baseUrl/user");

  if (userid == null) {
    print('User ID is null');
    return false;
  }
  try {
    final request = http.MultipartRequest('PATCH', url); // Use PATCH if that's what your backend expects

    // Add the user ID to the request body
    request.fields['userid'] = userid;
    if (_changedDp != null) {
      request.files.add(await http.MultipartFile.fromPath('profile_image_url', _changedDp!.path));
    }

    request.fields.addAll(updatedData);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('User updated successfully');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => lottie()),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        setState(() {
          editing = false;
        });
      });
      return true;
    } else if (response.statusCode == 404) {
      print('User not found');
      return false;
    } else {
      print('Failed to update user. Status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print("Exception Occurred $e");
    return false;
  }
}



  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserProvider>(context);
    
    // ... (keep the updateData function as is)

    return Theme(
      data: ThemeData(
        primaryColor: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          _buildProfilePicture(data),
                          SizedBox(height: 24),
                          _buildEditButton(),
                          SizedBox(height: 24),
                          _buildInputFields(data),
                        ],
                      ),
                      _buildUpdateButton(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(UserProvider data) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade400, spreadRadius: 5)],
      ),
      child: GestureDetector(
        onTap: () => imagePicker(ImageSource.gallery),
        child:  CircleAvatar(
        //   backgroundImage: data.getUserData!.profile_image_url != null 
        // ? NetworkImage(data.getUserData!.profile_image_url)
        // : NetworkImage(defaultNetworkImage),
         backgroundImage: _changedDp != null
            ? FileImage(_changedDp!) as ImageProvider<Object>?
            : (data.getUserData!.profile_image_url != null
                ? NetworkImage(data.getUserData!.profile_image_url) as ImageProvider<Object>?
                : NetworkImage(defaultNetworkImage) as ImageProvider<Object>?),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, color: Colors.white, size: 24),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          editing = !editing;
        });
      },
      icon: Icon(editing ? Icons.close : Icons.edit),
      label: Text(editing ? "Cancel" : "Edit Profile"),
      style: ElevatedButton.styleFrom(
        backgroundColor: editing ? Colors.red : Colors.blue,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }

  Widget _buildInputFields(UserProvider data) {
    return Column(
      children: [
        _buildTextField(
          controller: TextEditingController(text: data.getUserData!.name),
          label: "Name",
          icon: Icons.person,
          onChanged: (value) => updatedData['name'] = value,
        ),
        SizedBox(height: 16),
        _buildTextField(
          controller: TextEditingController(text: data.getUserData!.username),
          label: "Username",
          icon: Icons.alternate_email,
          onChanged: (value) => updatedData['username'] = value,
        ),
        SizedBox(height: 16),
        _buildTextField(
          controller: TextEditingController(text: data.getUserData!.email),
          label: "Phone",
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
          onChanged: (value) => updatedData['phone'] = value,
        ),
        SizedBox(height: 16),
        _buildTextField(
          controller: TextEditingController(text: data.getUserData!.email),
          label: "Email",
          icon: Icons.email,
          enabled: false,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool enabled = true,
    TextInputType? keyboardType,
    Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      enabled: editing && enabled,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return ElevatedButton.icon(
      onPressed:(){
        print("pressed");
        updateData().then((onValue){
          print(onValue);
          var data = Provider.of<UserProvider>(context, listen: false);
          data.userProvider();
        });
      },
      // onPressed: editing ? updateData : null,
      icon: Icon(Icons.save),
      label: Text("UPDATE", style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}