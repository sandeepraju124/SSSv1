import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
            //  scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(15),
            shrinkWrap: true,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                                fit: BoxFit.contain,
                              ),
                              color: Colors.grey,
                              shape: BoxShape.circle),
                          //                 child: Image.network(
                          //   "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                          // fit:BoxFit.cover ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 25,
                          child: Container(
                            // color: Colors.grey,
                            child: Text("Sandeep Raju",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 22,
                                    color: Colors.black)),
                          ))
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
                          child: Container(
                        // color: Colors.brown,
                        child: Column(children: [
                          Expanded(
                              child: Container(
                            // color: Colors.limeAccent,
                            child: Center(
                                child: Text("Friends",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 18,
                                        color: Colors.grey))),
                          )),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            // color: Colors.tealAccent,
                            child: Center(
                                child: Text("22",
                                    style: TextStyle(
                                        fontFamily: "Roboto", fontSize: 20))),
                          ))
                        ]),
                      )),
                      Expanded(
                          child: Container(
                        // color: Colors.lightGreenAccent,
                        child: Column(children: [
                          Expanded(
                              child: Container(
                            // color: Colors.purpleAccent,
                            child: Center(
                                child: Text("Review",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 18,
                                        color: Colors.grey))),
                          )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                // color: Colors.green,
                                child: Center(
                                    child: Text("345",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 20)))),
                          )
                        ]),
                      )),
                      Expanded(
                          child: Container(
                        // color: Colors.purple,
                        child: Column(children: [
                          Expanded(
                            child: Container(
                                // color: Colors.limeAccent,
                                child: Center(
                                    child: Text("Photos",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 18,
                                            color: Colors.grey)))),
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
                        ]),
                      )),
                    ],
                  )),
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
                              Icons.swipe_right,
                              color: Colors.black,
                            )),
                        title: Text(
                          "Compliments",
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
                              Icons.data_saver_on_sharp,
                              color: Colors.black,
                            )),
                        title: Text(
                          "Wishlist",
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
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrangeAccent)),
            ]));
  }
}
