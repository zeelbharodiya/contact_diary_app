import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Global {
  // 1
  // static File? image;
  // static String? fname;
  // static String? lname;
  // static String? phone;
  // static String? email;

  static List zeel = [];

}

class theme {
  static bool isDark = false;
  static bool fill = false;


  static ThemeData light =  ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black),
     ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 17, color: Colors.grey[400]),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,

    ),
   );


  static ThemeData dark = ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
        color: Colors.grey,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5,
      ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black12,
      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
        filled: true,
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
           borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
        ),
      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
    );
}


class Contact {
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? email;
  final File? Image ;

  Contact({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    required this.Image,
  });
}
