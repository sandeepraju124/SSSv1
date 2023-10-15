import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
const String baseUrl = "https://stoic1137.azurewebsites.net/";

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