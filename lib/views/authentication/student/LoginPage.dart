// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/student/SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ),
            child: Image.asset(
              "assets/images/student.jpg",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "ＷＥＬＣＯＭＥ",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 53, 70, 202)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "ＳＴＵＤＥＮＴＳ",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent)),
                  border: OutlineInputBorder(),
                  labelText: "Email ",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.red,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Email");
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent)),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter password";
                  } else if (value.length < 8) {
                    return "Password should be atleast 8";
                  }
                  return null;
                }),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              height: 50,
              width: 420,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authServices.signInUser(emailcontroller.text,
                        passwordcontroller.text, context, false);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 35, 56, 215)),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )),
          const SizedBox(
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
          const Text(
            "--------------------------or-------------------------",
            style: TextStyle(fontSize: 19),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              width: 300,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 161, 36)),
                child: const Text(
                  'Create new CB account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )),
        ],
      ),
    ));
  }
}
