import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';
import 'package:flutter_application_1/Pages/SendPage.dart';
import 'package:flutter_application_1/Pages/SignupPage.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/send",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/send": (context) => SendPage()
      },
    );
  }
}
