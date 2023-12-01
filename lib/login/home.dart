import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'google_signinPages/google_login_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //     CachedNetworkImage(
          //     imageUrl:user.photoURL.toString(),
          //     placeholder: (context, url) => new Icon(Icons.error),
          //     errorWidget: (context, url, error) => new Icon(Icons.error),
          //  ),
          // Image.network(user.photoURL.toString(),
          // errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
          //     return Text('Your error widget...');
          // },
// ),

          // CircleAvatar(radius: 40,
          //   backgroundImage: NetworkImage(user.photoURL.toString()),),
          Text(user.email.toString()),
          const SizedBox(
            height: 10,
          ),
          Text(user.displayName.toString()),
          GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInController>(context, listen: false);
                provider.logOut();
              },
              child: Text("Signout")),
        ],
      )),
    );
  }
}
