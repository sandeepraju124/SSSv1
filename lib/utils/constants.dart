// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

const Color tgDarkPrimaryColor = Color(0xFF00796B);
const Color tgLightPrimaryColor = Color(0xFFB2DFDB);
const Color tgPrimaryColor = Color(0xFF009688);
const Color tgTextIcon = Color(0xFFFFFFFF);
const Color tgAccentColor = Color(0xFF607D8B);
const Color tgPrimaryText = Color(0xFF212121);
const Color tgSecondaryText = Color(0xFF757575);
const Color tgDividerColor = Color(0xFFBDBDBD);

const Color secondaryColor80LightTheme = Color(0xFF202225);
const Color secondaryColor60LightTheme = Color(0xFF313336);
const Color secondaryColor40LightTheme = Color(0xFF585858);
const Color secondaryColor20LightTheme = Color(0xFF787F84);
const Color secondaryColor10LightTheme = Color(0xFFEEEEEE);
const Color secondaryColor5LightTheme = Color(0xFFF8F8F8);

// urls
const String baseUrl = "https://supernova1137.azurewebsites.net/";

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

// final kDarkTheme = ThemeData(
//   brightness: Brightness.dark,
//   fontFamily: 'SFProText',
//   primaryColor: kDarkPrimaryColor,
//   canvasColor: kDarkPrimaryColor,
//   backgroundColor: kDarkSecondaryColor,
//   accentColor: kAccentColor,
//   iconTheme: ThemeData.dark().iconTheme.copyWith(
//         color: kLightSecondaryColor,
//       ),
//   textTheme: ThemeData.dark().textTheme.apply(
//         fontFamily: 'SFProText',
//         bodyColor: kLightSecondaryColor,
//         displayColor: kLightSecondaryColor,
//       ),
// );

// final kLightTheme = ThemeData(
//   brightness: Brightness.light,
//   fontFamily: 'SFProText',
//   primaryColor: kLightPrimaryColor,
//   canvasColor: kLightPrimaryColor,
//   backgroundColor: kLightSecondaryColor,
//   accentColor: kAccentColor,
//   iconTheme: ThemeData.light().iconTheme.copyWith(
//         color: kDarkSecondaryColor,
//       ),
//   textTheme: ThemeData.light().textTheme.apply(
//         fontFamily: 'SFProText',
//         bodyColor: kDarkSecondaryColor,
//         displayColor: kDarkSecondaryColor,
//       ),
// );

// Container(
//                                   alignment: Alignment.center,
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal: 30, vertical: 5),
//                                   height: 30,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: secondaryColor20LightTheme),
//                                   ),
//                                   child: Text(
//                                       "Show ${data.askCommunityData!.data.length - displayQuestionCount} more questions"),
//                                 ),

Widget RetangularBorderBox(TextMsg) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      height: 25,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor20LightTheme),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Text(TextMsg,
          style: TextStyle(
            // color: secondaryColor20LightTheme,
            fontSize: 12.4,
          )),
    ),
  );
}

void makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $launchUri';
  }
}


// Container(
//                                   alignment: Alignment.center,
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal: 30, vertical: 5),
//                                   height: 30,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: secondaryColor20LightTheme),
//                                   ),
//                                   child: Text(
//                                        more questions"),
//                                 );


String defaultNetworkImage = "https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg";


void showSnackBar(BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}

Future<String?> getUserId() async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  // Return the userId (UID) if the user is signed in
  if (user != null) {
    return user.uid;
  } else {
    // User is not signed in
    print('No user is currently signed in.');
    return null;
  }
}




String formatCreatedAt(String createdAt) {
  DateTime now = DateTime.now();
  DateTime dateTime = DateFormat('EEE, dd MMM yyyy HH:mm:ss \'GMT\'').parseUtc(createdAt).toLocal();

  Duration difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
  } else {
    return DateFormat('MMM d, yyyy').format(dateTime);
  }
}
