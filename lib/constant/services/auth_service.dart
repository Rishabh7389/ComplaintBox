// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/helper/helper_service.dart';
import 'package:flutter_application_1/constant/services/complaint_services.dart';
import 'package:flutter_application_1/views/widgets/app_snackbar.dart';

class AuthServices {
  HelperService helperService = HelperService();

  ComplaintServices complaintServices = ComplaintServices();
  Future signupuser(
      String email, String password, String fullName, bool isAdmin) async {
    try {
      User user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user!;
      if (user != null) {
        ComplaintServices(uid: user.uid).saveuserdata(fullName, email, isAdmin);
        await helperService.setValue("uid", user.uid);
        await helperService.setValue("isAdmin", isAdmin);
        await helperService.setValue("loggedinStatus", true);
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future signInUser(
      String email, String password, context, bool isAdmin) async {
    try {
      User user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user!;
      if (user != null) {
        await helperService.setValue("uid", user.uid);
        await helperService.setValue("loggedinStatus", true);
        Navigator.pushNamedAndRemoveUntil(
            context, isAdmin ? '/homeadmin' : "/home", (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
      log(e.toString());
    }
  }

  Future signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await helperService.setValue("loggedinStatus", false);
      log("signed out");
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
