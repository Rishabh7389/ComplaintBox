import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool _showPwd = true;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/images/complain.jpg",
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Hostellers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "User Name ",
              ),
              onChanged: (value) {
                name = value;
                setState(() {});
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Username");
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter password";
                  } else if (value.length < 8) {
                    return "Password should be atleast 8";
                  }
                  return null;
                }),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              height: 50,
              width: 400,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () => moveToHome(context),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 110, 24, 222)),
              )),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password ?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 73, 76, 78)),
            ),
          ),
          Text(
            "--------------------------or-------------------------",
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              width: 300,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'Create new CB account',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 31, 161, 36)),
              )),
        ],
      ),
    ));
  }
}
