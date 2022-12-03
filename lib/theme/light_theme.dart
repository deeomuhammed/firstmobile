import 'package:flutter/material.dart';

import 'package:userapp/theme/constants.dart';



ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    
    brightness: Brightness.light,
    fontFamily: "Plus Jakarta",
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFFD7D0FF),
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: blackColor40),
    ),
   
  
    inputDecorationTheme: lightInputDecorationTheme,
  
    appBarTheme: appBarLightTheme,

    
  );
}
const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor: lightGreyColor,
  filled: true,
  hintStyle: TextStyle(color: greyColor),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
),

);

const AppBarTheme appBarLightTheme = AppBarTheme(
  backgroundColor: Color(0xFFD7D0FF),
  elevation: 0,
  iconTheme: IconThemeData(color: blackColor),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
);

