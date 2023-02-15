// ignore_for_file: prefer_const_constructors, file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/widgets/complaint_container.dart';

import '../../constant/helper/helper_service.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  HelperService helperService = HelperService();

  AuthServices authServices = AuthServices();

  String? uid;

  getUserID() async {
    uid = await helperService.getValue("uid").then((value) {
      uid = value;
      log(value.toString());
      return uid;
    });
  }

  @override
  void initState() {
    getUserID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2b3258),
        title: Text(
          "All Complaints",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff2b3258),
        child: ListView(
          children: [
            Image.asset("assets/images/back1.png"),
            SizedBox(
              height: 750,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff2b3258),
                Color.fromARGB(255, 138, 130, 139)
              ])),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2b3258)),
                  onPressed: () {
                    authServices.signOut(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/selectUser", (route) => false);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("user")
            .doc("u9kHbadGrwRMESFBuD0Zb5Z9Oho2")
            .collection('complaints')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  var compData = data[index];
                  return ComplaintContainer(
                    complaintValue: compData['complaint'],
                    nameValue: compData['name'],
                    regValue: compData['registration'],
                    hostelValue: compData['hostel'],
                    roomValue: compData['room'],
                    mobValue: compData['mobile'],
                  );
                }));
          }
          return SizedBox.shrink();
        },
      )),
    );
  }
}
