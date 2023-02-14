// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/helper/helper_service.dart';
import 'package:flutter_application_1/views/admin/HomePageAdmin.dart';
import 'package:flutter_application_1/views/authentication/admin/SignupPageAdmin.dart';
import 'package:flutter_application_1/views/authentication/admin/LoginPageAdmin.dart';
import 'package:flutter_application_1/views/guest/guestpage.dart';
import 'package:flutter_application_1/views/student/HomePage.dart';
import 'package:flutter_application_1/views/authentication/student/LoginPage.dart';
import 'package:flutter_application_1/views/SendPage.dart';
import 'package:flutter_application_1/views/authentication/student/SignupPage.dart';
import 'package:flutter_application_1/views/authentication/SelectuserPage.dart';
import 'package:flutter_application_1/views/student/yourcomplaints_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HelperService helperService = HelperService();

  bool? isLoggedIn;

  getLoggedInStatus() async {
    await helperService.getValue("loggedinStatus").then((value) {
      log(value.toString());
      if (value != null) {
        setState(() {
          isLoggedIn = value;
        });
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    });
  }

  String? uid;

  getUserID() async {
    await helperService.getValue("uid").then((value) {
      uid = value;
      return uid;
    });
  }

  String adminUId = "u9kHbadGrwRMESFBuD0Zb5Z9Oho2";

  @override
  void initState() {
    getLoggedInStatus();
    getUserID();
    super.initState();
  }

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
      initialRoute: isLoggedIn!
          ? (uid == adminUId ? "/homeadmin" : '/home')
          : "/selectUser",
      routes: {
        "/home": (context) => HomePage(),
        "/selectUser": (context) => const UserPage(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => SignupPage(),
        "/send": (context) => const SendPage(),
        "/loginadmin": (context) => const LoginPage2(),
        "/signupadmin": (context) => const SignupPage2(),
        "/homeadmin": (context) => const HomePage2(),
        "/guest": (context) => const GuestPage(),
        "/yourcomp": (context) => const YourComplaintsPage(),
      },
    );
  }
}
