import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';
import 'package:flutter_application_1/Pages/SendPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  moveToSend(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SendPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 28, 214),
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
                "assets/images/feedback.jpg",
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "'Enter Your Details'",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
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
                  decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Hostel Name"),
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Room No."),
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
                  decoration: const InputDecoration(
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
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Managemnet Mobile No."),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Mobile No.");
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  height: 50,
                  width: 390,
                  child: ElevatedButton(
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () => moveToSend(context),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 14, 143, 219)),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Any Other Query? Call On 7999855204",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 164, 22)),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 800,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 14, 143, 219)),
                )),
          ],
        ),
      ),
    );
  }
}
