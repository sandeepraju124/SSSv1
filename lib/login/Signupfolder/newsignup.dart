// // import 'package:backendapp/screens/add_service_screens/addService.dart';
// // import 'package:backendapp/screens/location_search_screen.dart';
// // import 'package:backendapp/screens/map.dart';
// // import 'package:backendapp/utils/constants.dart';
// // import 'package:backendapp/utils/navigators.dart';
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/providers/user_provider.dart';
// import '../../utils/constants.dart';
// import 'package:provider/provider.dart';

// class NewSignuppage extends StatefulWidget {
//   const NewSignuppage({super.key});

//   @override
//   State<NewSignuppage> createState() => _NewSignuppageState();
// }

// class _NewSignuppageState extends State<NewSignuppage> {
//   bool passwordObscured = true;

//   // String selectedGender = "";
//   Gender? _selectedGender;
//   File? _dp;
//   bool _isLoading = false;

//   Future imagePicker(ImageSource source) async {
//     ImagePicker pick = ImagePicker();
//     final pickedFile = await pick.pickImage(source: source);
//     setState(() {
//       _dp = File(pickedFile!.path);
//     });
//   }

//   Widget _buildGenderOption(Gender gender, String label) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedGender = gender;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//             // borderRadius: BorderRadius.circular(16),
//             color: _selectedGender == gender
//                 ? tgLightPrimaryColor
//                 : Colors.grey[200]),
//         child: Text(label),
//       ),
//     );
//   }

//   final _firstnamecontroller = TextEditingController();
//   final _lastnamecontroller = TextEditingController();
//   final _emailcontroller = TextEditingController();
//   final _passwordcontroller = TextEditingController();
//   final _mobilenumbercontroller = TextEditingController();

//   final formkey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     super.dispose();
//     _emailcontroller.dispose();
//     _firstnamecontroller.dispose();
//     _lastnamecontroller.dispose();
//     _mobilenumbercontroller.dispose();
//     _passwordcontroller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var userpro = Provider.of<UserProvider>(context, listen: false);

//     // function things to do
//     //register with firebase
//     //post data to mongodb
//     //fetch data and store on provider after posting

//     // Future signup() async {
//     //   print('Sign up clicked');
//     //   setState(() {
//     //   _isLoading = true;
//     // });
//     //   try {
//     //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //         email: _emailcontroller.text.trim(),
//     //         password: _passwordcontroller.text.trim());

//     //     final user = FirebaseAuth.instance.currentUser;
//     //     final userid = user?.uid;

//     //     Map<String, String> body = {
//     //       'name': _firstnamecontroller.text.trim(),
//     //       'email': _emailcontroller.text.trim(),
//     //       "username": _lastnamecontroller.text.trim(),
//     //       "street": "hyderabad",
//     //       "state": "telangana",
//     //       "zipcode": "500072",
//     //       "lat": "546",
//     //       "lng": "648",
//     //       "userid": userid.toString()
//     //     };
//     //     final request = http.MultipartRequest(
//     //         "POST",
//     //         Uri.parse(
//     //           "$baseUrl/user",
//     //         ));
//     //     if (_dp != null) {
//     //       request.files.add(await http.MultipartFile.fromPath('dp', _dp!.path));
//     //     }
//     //     // ..files.add(await http.MultipartFile.fromPath('dp', _dp!.path))
//     //     request.fields.addAll(body);

//     //     final response = await request.send();
//     //     print(response.statusCode);
//     //     print(response);
//     //     if (response.statusCode == 200) {
//     //       final responseBody = await response.stream.bytesToString();
//     //       print(responseBody);

//     //       //fetch data and store on provider
//     //       userpro.userProvider();

//     //       print('user created successfully');
//     //       return 'user created successfully';
//     //     } else {
//     //       throw Exception('Failed to create user');
//     //     }
//     //   } on FirebaseAuthException catch (e) {
//     //     print(e);
//     //     showDialog(
//     //         context: context,
//     //         builder: (context) {
//     //           return AlertDialog(
//     //             content: Text(e.message.toString()),
//     //           );
//     //         });
//     //   } catch (e) {
//     //     print(e.toString());
//     //     throw Exception('EXception Failed to create user : $e');
//     //   }finally {
//     //   setState(() {
//     //     _isLoading = false;
//     //   });
//     // }
//     // }

//     Future signup() async {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         print('Sign up clicked');
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailcontroller.text.trim(),
//           password: _passwordcontroller.text.trim(),
//         );

//         final user = FirebaseAuth.instance.currentUser;
//         final userid = user?.uid;

//         Map<String, String> body = {
//           'name': _firstnamecontroller.text.trim(),
//           'email': _emailcontroller.text.trim(),
//           'username': _lastnamecontroller.text.trim(),
//           // 'street': 'hyderabad',
//           // 'state': 'telangana',
//           // 'zipcode': '500072',
//           // 'lat': '546',
//           // 'lng': '648',
//           'userid': userid.toString(),
//           'phone': _mobilenumbercontroller.text.trim(),
//         };
//         final request = http.MultipartRequest(
//           'POST',
//           Uri.parse('$baseUrl/user'),
//         );
//         if (_dp != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//               'profile_image_url', _dp!.path));
//         }
//         request.fields.addAll(body);

//         final response = await request.send();
//         print(response.statusCode);
//         print(response);
//         if (response.statusCode == 200) {
//           final responseBody = await response.stream.bytesToString();
//           print(responseBody);

//           // Fetch data and store on provider
//           var userpro = Provider.of<UserProvider>(context, listen: false);
//           await userpro.userProvider();

//           print('User created successfully');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('User created successfully'),
//             ),
//           );
//           return 'User created successfully';
//         } else {
//           throw Exception('Failed to create user');
//         }
//       } on FirebaseAuthException catch (e) {
//         print(e);
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text(e.message.toString()),
//             );
//           },
//         );
//       } catch (e) {
//         print(e.toString());
//         throw Exception('Exception: Failed to create user: $e');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//           elevation: 1,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back)),
//           backgroundColor: Color.fromARGB(255, 15, 100, 91),
//           title: const Text(
//             "REGISTER",
//             style: TextStyle(color: Colors.white),
//           )),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 65,
//                     child: SizedBox(
//                       // color: Colors.red,
//                       height: 188,
//                       child: Padding(
//                         padding: const EdgeInsets.all(14.0),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               TextFormField(
//                                 controller: _firstnamecontroller,
//                                 decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.all(10),
//                                     border: OutlineInputBorder(),
//                                     labelText: 'Name',
//                                     labelStyle:
//                                         TextStyle(color: tgSecondaryText),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: tgSecondaryText)),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: tgAccentColor))),
//                                 // autofocus: false,
//                                 maxLines: null,
//                                 keyboardType: TextInputType.text,
//                                 validator: (value) {
//                                   if (value!.isEmpty ||
//                                       !RegExp(r'^[a-z A-Z]+$')
//                                           .hasMatch(value)) {
//                                     return "Enter Name";
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               // SizedBox(height: 10),

//                               ////last name ///////
//                               TextFormField(
//                                 controller: _lastnamecontroller,
//                                 decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.all(10),
//                                     border: OutlineInputBorder(),
//                                     labelText: 'Username',
//                                     labelStyle:
//                                         TextStyle(color: tgSecondaryText),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: tgSecondaryText)),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: tgAccentColor))),
//                                 autofocus: false,
//                                 maxLines: null,
//                                 keyboardType: TextInputType.text,
//                                 validator: (value) {
//                                   if (value!.isEmpty ||
//                                       !RegExp(r'^[a-z A-Z]+$')
//                                           .hasMatch(value)) {
//                                     return "Enter Username";
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 35,
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                       // color: Colors.red,
//                       color: Colors.grey[200],
//                       height: 150,
//                       child: GestureDetector(
//                         onTap: () {
//                           imagePicker(ImageSource.gallery);
//                         },
//                         child: _dp == null
//                             ? CircleAvatar(
//                                 radius: 50,
//                                 backgroundImage:
//                                     AssetImage("images/defaulltdp.png"))
//                             : CircleAvatar(
//                                 radius: 50, backgroundImage: FileImage(_dp!)),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               // SizedBox(
//               //   height: 5,
//               // ),
//               ///// Gender option ///////////

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildGenderOption(Gender.male, "Male"),
//                   _buildGenderOption(Gender.female, "Female"),
//                   _buildGenderOption(Gender.preferNotToSay, "prefer not to say")
//                 ],
//               ),
//               SizedBox(
//                 height: 6,
//               ),
//               const Divider(
//                 height: 6,
//                 thickness: 1,
//                 color: secondaryColor10LightTheme,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               ///////// email field////
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: TextFormField(
//                   controller: _emailcontroller,
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(),
//                       labelText: ' Email',
//                       labelStyle: TextStyle(color: tgSecondaryText),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgSecondaryText)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgAccentColor))),
//                   autofocus: false,
//                   maxLines: null,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter E-mail";
//                     }
//                     bool emailValid = RegExp(
//                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(value);
//                     if (!emailValid) {
//                       return "Enter valid email";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               //// passsword field /////////

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: TextFormField(
//                   controller: _passwordcontroller,
//                   keyboardType: TextInputType.text,
//                   obscureText: passwordObscured,
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                       labelStyle: TextStyle(color: tgSecondaryText),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgSecondaryText)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgAccentColor)),
//                       suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               passwordObscured = !passwordObscured;
//                             });
//                           },
//                           child: Icon(
//                             passwordObscured
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility,
//                             color: Colors.grey.shade400,
//                             size: 20.0,
//                           ))),
//                   autofocus: false,
//                   // maxLines: null,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter password";
//                     } else if (_passwordcontroller.text.length < 6) {
//                       return "Password should be more than 6 characters";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(height: 11),

//               ///////mobilenumber field /////////

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: TextField(
//                   controller: _mobilenumbercontroller,
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(),
//                       labelText: ' Mobile Number',
//                       labelStyle: TextStyle(color: tgSecondaryText),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgSecondaryText)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: tgAccentColor))),
//                   autofocus: false,
//                   maxLines: null,
//                   keyboardType: TextInputType.phone,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//       bottomNavigationBar: InkWell(
//         onTap: () async {
//           if (formkey.currentState!.validate()) {
//             await signup();
//           }
//         },
//         child: Container(
//           height: 55,
//           width: double.infinity,
//           color: tgAccentColor,
//           child: Center(
//               child: _isLoading
//                   ? Center(
//                       child: CircularProgressIndicator(
//                       backgroundColor: Colors.white,
//                     ))
//                   : Text(
//                       "Register",
//                       style: TextStyle(color: Colors.white, fontSize: 17),
//                     )),
//         ),
//       ),
//     );
//   }
// }

// enum Gender { male, female, preferNotToSay }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/login/login%20folder/newloginpage.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewSignupPage extends StatefulWidget {
  const NewSignupPage({Key? key}) : super(key: key);

  @override
  _NewSignupPageState createState() => _NewSignupPageState();
}

class _NewSignupPageState extends State<NewSignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  File? _profileImage;
  String? _selectedGender;

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Future signup() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     // print('Sign up clicked');
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );

  //     final user = FirebaseAuth.instance.currentUser;
  //     final userid = user?.uid;

  //     Map<String, String> body = {
  //       'name': _nameController.text.trim(),
  //       'email': _emailController.text.trim(),
  //       'username': _usernameController.text.trim(),
  //       // 'street': 'hyderabad',
  //       // 'state': 'telangana',
  //       // 'zipcode': '500072',
  //       // 'lat': '546',
  //       // 'lng': '648',
  //       'userid': userid.toString(),
  //       'phone': _phoneController.text.trim(),
  //     };
  //     final request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('$baseUrl/user'),
  //     );
  //     if (_profileImage != null) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //           'profile_image_url', _profileImage!.path));
  //     }
  //     request.fields.addAll(body);

  //     final response = await request.send();
  //     print(response.statusCode);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       print(responseBody);

  //       // Fetch data and store on provider
  //       var userpro = Provider.of<UserProvider>(context, listen: false);
  //       await userpro.userProvider();

  //       print('User created successfully');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('User created successfully'),
  //         ),
  //       );
  //       return 'User created successfully';
  //     } else {
  //       throw Exception('Failed to create user');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text(e.message.toString()),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //     throw Exception('Exception: Failed to create user: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

// Future<void> signup() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//     );

//     final user = FirebaseAuth.instance.currentUser;
//     final userid = user?.uid;

//     Map<String, String> body = {
//       'name': _nameController.text.trim(),
//       'email': _emailController.text.trim(),
//       'username': _usernameController.text.trim(),
//       'userid': userid.toString(),
//       'phone': _phoneController.text.trim(),
//     };

//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('$baseUrl/user'),
//     );

//     if (_profileImage != null) {
//       request.files.add(await http.MultipartFile.fromPath(
//           'profile_image_url', _profileImage!.path));
//     }

//     request.fields.addAll(body);

//     final response = await request.send();
//     final responseBody = await response.stream.bytesToString();

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       if (!mounted) return;  // Check if the widget is still mounted
//       var userpro = Provider.of<UserProvider>(context, listen: false);
//       await userpro.userProvider();

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User created successfully'),
//         ),
//       );
//     } else {
//       if (!mounted) return;  // Check if the widget is still mounted
//       print('Failed to create user: ${response.statusCode} - $responseBody');
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Text('Failed to create user: ${response.statusCode}'),
//           );
//         },
//       );
//     }
//   } on FirebaseAuthException catch (e) {
//     if (!mounted) return;  // Check if the widget is still mounted
//     print('FirebaseAuthException: ${e.message}');
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Text(e.message.toString()),
//         );
//       },
//     );
//   } catch (e) {
//     if (!mounted) return;  // Check if the widget is still mounted
//     print('Exception: $e');
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Text('Failed to create user: $e'),
//         );
//       },
//     );
//   } finally {
//     if (mounted) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
// }

Future<void> signup() async {
  setState(() {
    _isLoading = true;
  });

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid;

    Map<String, String> body = {
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'username': _usernameController.text.trim(),
      'userid': userid.toString(),
      'phone': _phoneController.text.trim(),
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/user'),
    );

    if (_profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'profile_image_url', _profileImage!.path));
    }

    request.fields.addAll(body);

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    // Handle both 200 and 201 as success responses
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (!mounted) return; // Check if the widget is still mounted
      
      // Refresh user data after successful signup
      var userpro = Provider.of<UserProvider>(context, listen: false);
      await userpro.userProvider(); // Refresh user data

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User created successfully'),
        ),
      );
    } else {
      if (!mounted) return; // Check if the widget is still mounted
      print('Failed to create user: ${response.statusCode} - $responseBody');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Failed to create user: ${response.statusCode}'),
          );
        },
      );
    }
  } on FirebaseAuthException catch (e) {
    if (!mounted) return; // Check if the widget is still mounted
    print('FirebaseAuthException: ${e.message}');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
    );
  } catch (e) {
    if (!mounted) return; // Check if the widget is still mounted
    print('Exception: $e');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Failed to create user: $e'),
        );
      },
    );
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}



  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Implement your signup logic here
      // print('Form submitted');
      await signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        title: const Text(
          'Join Us Today',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left_rounded)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                _buildProfileImagePicker(),
                const SizedBox(height: 32),
                _buildForm(),
                const SizedBox(height: 32),
                _buildSubmitButton(),
                const SizedBox(height: 16),
                _buildSignInLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Create Your Account',
        //   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        //         // color: const Color(0xFF1A3365),
        //         fontWeight: FontWeight.bold,
        //       ),
        // ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text(
            'Please fill in the information below',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImagePicker() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          backgroundImage:
              _profileImage != null ? FileImage(_profileImage!) : null,
          child: _profileImage == null
              ? Icon(Icons.add_a_photo, size: 30, color: Colors.grey[400])
              : null,
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'Full Name',
            icon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _usernameController,
            label: 'Username',
            icon: Icons.alternate_email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            icon: Icons.lock_outline,
            obscureText: _obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildGenderDropdown(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 15, // Adjust the font size as needed
        ),
        prefixIcon: Icon(
          icon,
          size: 20,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFF1A3365)),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      decoration: InputDecoration(
        labelText: 'Gender',
        prefixIcon: const Icon(Icons.people_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFF1A3365)),
        ),
      ),
      items: ['Male', 'Female', 'Prefer not to say']
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedGender = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a gender';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: _isLoading ? null : _submitForm,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A3365),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (NewLoginPage())));
        },
        child: Text(
          'Already have an account? Sign in',
          style: TextStyle(color: const Color(0xFF1A3365)),
        ),
      ),
    );
  }
}
