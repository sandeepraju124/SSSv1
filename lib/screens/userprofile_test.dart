// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/login/google_signinPages/google_login_controller.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/EditProfile.dart';
import 'package:sssv1/screens/terms_and_conditions.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/custormer_support.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserProvider>(context);
    final provider =
        Provider.of<GoogleSignInController>(context, listen: false);
    // print("data.getUserData!.username");
    // // print(data.getUserData!.username);
    // print("data.getUserData!.dp");
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white60,
        title: Text('Profile'),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              showSnackBar(context, "feature is currently in progress");
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              showSnackBar(context, "feature is currently in progress");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius:
                        44, // Adjust the radius to include the border thickness
                    backgroundColor: tgPrimaryColor,
                    child: CircleAvatar(
                      radius: 42, // Adjusted for the gap
                      backgroundColor: Colors.white, // Gap color
                      // backgroundImage: AssetImage('images/defaulltdp.png'),
                      backgroundImage: NetworkImage(
                          data.getUserData?.profile_image_url ??
                              defaultNetworkImage),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12,
                          child: Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // 'Sai Ram Akula',
                    data.getUserData?.username ?? "No Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'JOINED SINCE OCT 23',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: ListTile(
                // title: Text('₹173.12'),
                title: Text(data.getUserData?.name ?? "Loading..."),
                // subtitle: Text('Stocks, F&O balance'),
                subtitle: Text(data.getUserData?.email ?? "No Email"),
                trailing: ElevatedButton(
                  onPressed: () {
                    navigatorPush(context, EditProfile());
                  },
                  child: Text(
                    'Edit profile',
                    style: TextStyle(color: tgPrimaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 46),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.group_add,
                      size: 20,
                    ),
                    title: Text(
                      'Refer',
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        showSnackBar(
                            context, "feature is currently in progress");
                      },
                      child: Text(
                        'Invite',
                        style: TextStyle(color: tgPrimaryColor),
                      ),
                    ),
                  ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(Icons.shopping_bag),
                  //   title: Text(
                  //     'Your orders',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomerSupportPopup();
                        },
                      );
                    },
                    leading: Icon(Icons.support_agent),
                    title: Text(
                      'Customer support 24x7',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(Icons.person),
                  //   title: Text(
                  //     'Account details',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(Icons.account_balance),
                  //   title: Text(
                  //     'Banks & Mandates',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      navigatorPush(context, TermsAndConditions());
                    },
                    leading: Icon(Icons.receipt),
                    title: Text(
                      'Terms and conditions',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: tgTextIcon,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              "Are you sure you wanna logout",
                              style:
                                  TextStyle(fontSize: 16, letterSpacing: 0.2),
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'No!',
                                  style: TextStyle(color: tgPrimaryColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  onPressed: () async {
                                    await provider.logOut();
                                    var userprov = Provider.of<UserProvider>(
                                        context,
                                        listen: false);
                                    userprov.clearUserData();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Yes, logout',
                                    style: TextStyle(color: tgPrimaryColor),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Log out',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
