// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sssv1/login/google_login_controller.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/terms_and_conditions.dart';
import 'package:sssv1/utils/navigator.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserProvider>(context,listen: false);


    final user = FirebaseAuth.instance.currentUser;
    String? email = user?.email;
    String? name = user?.displayName;
    final provider =
        Provider.of<GoogleSignInController>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          //  scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.orange,
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                data.getUserData!.dp == 0 ?
                                "https://upload.wikimedia.org/wikipedia/commons/7/72/Default-welcomer.png"
                                 : data.getUserData!.dp.toString()
                                


                                  // 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
                                  ),
                              fit: BoxFit.contain,
                            ),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                        //                 child: Image.network(
                        //   "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                        // fit:BoxFit.cover ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        flex: 25,
                        child: Text(
                          email!,
                          style: const TextStyle(fontSize: 15),
                        )),
                    Text(name ?? "",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                            color: Colors.black)),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            // Friends Review Photos Container
            Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(children: [
                      Expanded(
                          child: Center(
                              child: Text("Friends",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      color: Colors.grey)))),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // color: Colors.tealAccent,
                        child: Center(
                            child: Text("22",
                                style: TextStyle(
                                    fontFamily: "Roboto", fontSize: 20))),
                      ))
                    ])),
                    Expanded(
                        child: Column(children: [
                      Expanded(
                          child: Center(
                              child: Text("Review",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      color: Colors.grey)))),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            // color: Colors.green,
                            child: Center(
                                child: Text("345",
                                    style: TextStyle(
                                        fontFamily: "Roboto", fontSize: 20)))),
                      )
                    ])),
                    Expanded(
                        child: Column(children: [
                      Expanded(
                        child: Center(
                            child: Text("Photos",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 18,
                                    color: Colors.grey))),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          // color: Colors.tealAccent,
                          child: Center(
                              child: Text("0",
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 20))),
                        ),
                      )
                    ])),
                  ],
                )),

            ////////////// ends ////////////////

            const SizedBox(
              height: 20,
            ),

            Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.messenger_rounded,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Review",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    SizedBox(height: 7),
                    Divider(
                      color: Colors.grey,
                      endIndent: 34,
                      indent: 34,
                    ),
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.swipe_right,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Compliments",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    SizedBox(height: 7),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                      indent: 30,
                    ),
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.data_saver_on_sharp,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Wishlist",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    SizedBox(height: 7),
                    Divider(
                      color: Colors.white,
                      endIndent: 30,
                      indent: 30,
                    ),
                  ],
                )),

            ///////////// this container ends here ////////////////
            SizedBox(
              height: 20,
            ),
            Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.edit_note_sharp,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Edit Profile",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                      indent: 30,
                    ),
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.help_center,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Help",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                      indent: 30,
                    ),
                    Expanded(
                        child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.group_outlined,
                            color: Colors.black,
                          )),
                      title: Text(
                        "Refer Friend",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                    )),
                    Divider(
                      color: Colors.white,
                      endIndent: 30,
                      indent: 30,
                    ),
                  ],
                )),
            //// This above container ends here /////////////
            SizedBox(
              height: 20,
            ),
            // logout
            InkWell(
              onTap: () {
                // final provider =
                //     Provider.of<GoogleSignInController>(context, listen: false);
                provider.logOut();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                // color: Colors.white,
                width: double.infinity,
                child: ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.edit_note_sharp,
                        color: Colors.black,
                      )),
                  title: Text(
                    "Log out",
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                final provider =
                    Navigators().navigatorPush(context, TermsAndConditions());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                // color: Colors.white,
                width: double.infinity,
                child: ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.edit_note_sharp,
                        color: Colors.black,
                      )),
                  title: Text(
                    "Terms & conditions",
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrangeAccent)),
          ],
        ));
  }
}
