// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/helper/helper_service.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/constant/services/complaint_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference complaints =
      FirebaseFirestore.instance.collection("user");

  TextEditingController namecontroller = TextEditingController();
  TextEditingController registrationcontroller = TextEditingController();
  TextEditingController hostelnamecontroller = TextEditingController();
  TextEditingController roomnocontroller = TextEditingController();
  TextEditingController mobilenocontroller = TextEditingController();
  TextEditingController compalintcontroller = TextEditingController();

  ComplaintServices complaintServices = ComplaintServices();
  AuthServices authServices = AuthServices();

  final firestoreInstance = FirebaseFirestore.instance;

  String? userName;
  String? userEmail;
  String? reg;

  HelperService helperService = HelperService();

  getUserData() async {
    var uid = await helperService.getValue("uid");
    DocumentSnapshot userSnapshot =
        await firestoreInstance.collection("user").doc(uid).get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      log('user data cast to Map: $userData');
      userName = userData['fullName'];
      userEmail = userData['email'];
      reg = userData['registration'];
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2b3258),
          title: const Text(
            "Complaint Box",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/banner.jpg",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter Your Details",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 128, 130, 130))),
                        border: OutlineInputBorder(),
                        labelText: "Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Name");
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: registrationcontroller,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 128, 130, 130))),
                        border: OutlineInputBorder(),
                        labelText: "Registration No."),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Registration No.");
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: hostelnamecontroller,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 128, 130, 130))),
                          border: OutlineInputBorder(),
                          labelText: "Hostel Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Hostel Name");
                        }
                        return null;
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: roomnocontroller,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 128, 130, 130))),
                        border: OutlineInputBorder(),
                        labelText: "Room No."),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Room No.");
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mobilenocontroller,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 128, 130, 130))),
                        border: OutlineInputBorder(),
                        labelText: "Student Mobile No."),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Mobile No.");
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: compalintcontroller,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 128, 130, 130))),
                        border: OutlineInputBorder(),
                        labelText: "Your Complaint"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Complaint");
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                    height: 50,
                    width: 390,
                    child: ElevatedButton(
                      onPressed: (() async {
                        if (_formKey.currentState!.validate()) {
                          await complaintServices.createComplaint(
                              compalintcontroller.text,
                              registrationcontroller.text,
                              namecontroller.text,
                              mobilenocontroller.text,
                              hostelnamecontroller.text,
                              roomnocontroller.text,
                              "Complaint Pending");
                          compalintcontroller.clear();
                          registrationcontroller.clear();
                          namecontroller.clear();
                          mobilenocontroller.clear();
                          hostelnamecontroller.clear();
                          roomnocontroller.clear();
                          Navigator.pushNamed(context, "/send");
                        }
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2b3258)),
                      child: const Text(
                        'Send',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Any Other Query? Call On XXXXXXXXXX",
                  style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: const Color(0xff2b3258),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff2b3258),
                        Color.fromARGB(255, 138, 130, 139)
                      ])),
                      child: Center(
                          child: Text(
                        "Name : $userName",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff2b3258),
                        Color.fromARGB(255, 138, 130, 139)
                      ])),
                      child: Center(
                          child: Text(
                        "Registration : $reg",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff2b3258),
                        Color.fromARGB(255, 138, 130, 139)
                      ])),
                      child: Center(
                          child: Text(
                        "Email : $userEmail",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xff2b3258),
                      Color.fromARGB(255, 138, 130, 139)
                    ])),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/yourcomp');
                        },
                        child: const Text(
                          "Your Complaints",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 450,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff2b3258),
                        Color.fromARGB(255, 138, 130, 139)
                      ])),
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          authServices.signOut(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2b3258)),
                        child: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
