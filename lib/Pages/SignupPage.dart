import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text)
          .then((value) {
        print("Created New Account");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 147, 19, 198)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Create an Accont,its free",
              style: TextStyle(),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "UserId",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your UserId';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 80,
                width: 350,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 50,
                width: 330,
                child: ElevatedButton(
                    onPressed: () => moveToHome(context),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 134, 20, 215)))),
            SizedBox(
              height: 30,
            ),
            Text(
              "--------------------------or-------------------------",
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40,
                width: 350,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Already have an account ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 31, 161, 36)),
                )),
          ],
        ),
      ),
    );
  }
}
