import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pride_flutter/src/other/Constants.dart';

class AppTheme {
  ThemeData appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffF8FAFD),
          brightness: Brightness.light
        ),
    //fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   // statusBarColor: Colors.green,
        //   statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        //   statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        // ),
        backgroundColor: const Color(0xffF8FAFD),
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
            textStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black)),
    textTheme: const TextTheme(
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),

        // labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
        labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(primaryColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(62)))),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      hintStyle: const TextStyle(fontSize: 14,),
      filled: true,
      fillColor: Colors.grey[50],
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
            elevation: MaterialStateProperty.all(0.0),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.transparent)))),
    tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        labelStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
        indicator: const UnderlineTabIndicator(

            borderSide: BorderSide(
              width: 4.0,
              color: secondaryAccent,
            ),
            insets: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0))),

    chipTheme: ChipThemeData(
        padding: const EdgeInsets.all(14),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        secondarySelectedColor: Color(0xff41AE49),
        selectedShadowColor: Color(0xff41AE49),
        selectedColor: Color(0xff41AE49),
        // selectedColor: Colors.green,
        disabledColor: Colors.white,
        labelStyle: GoogleFonts.inter(

            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),


    scaffoldBackgroundColor: const Color(0xffF8FAFD),


  );
}
