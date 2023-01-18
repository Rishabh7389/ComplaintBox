import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage2.dart';
import 'package:flutter_application_1/Pages/SignupPage2.dart';
import 'package:flutter_application_1/Pages/LoginPage2.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';
import 'package:flutter_application_1/Pages/SendPage.dart';
import 'package:flutter_application_1/Pages/SignupPage.dart';
import 'package:flutter_application_1/Pages/UserPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage2(),
        "/home": (context) => HomePage(),
        "/user": (context) => UserPage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/send": (context) => SendPage(),
        "/login2": (context) => LoginPage2(),
        "/signup2": (context) => SignupPage2(),
        "/home2": (context) => HomePage2()
      },
    );
  }
}
