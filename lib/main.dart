import 'package:calculator/HomePage.dart';
import 'package:calculator/MyRoutes.dart';
import 'package:calculator/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      // home: welcomePage(),
      routes: {
        "/": (context) => welcomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
