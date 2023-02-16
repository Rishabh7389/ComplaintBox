// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/admin/LoginPageAdmin.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2b3258)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Create an Accont,its free",
              style: TextStyle(),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 83, 85, 84))),
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    prefixIcon: Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 28, 27, 27),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your UserId';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 98, 102, 100))),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 22, 22, 22),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
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
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 90, 92, 91))),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                        labelText: " Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter password";
                      } else if (value.length < 8) {
                        return "Password should be atleast 8";
                      }
                      return null;
                    })),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 80,
                width: 350,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: confirmpasscontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 106, 108, 107))),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                      labelText: " Confirm Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value != passwordcontroller.text) {
                      return 'Password not match';
                    }

                    return null;
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate() &&
                          ((emailcontroller.text.split('@'))[1] ==
                              'vitbhopal.ac.in')) {
                        authServices.signupuser(
                            emailcontroller.text,
                            passwordcontroller.text,
                            namecontroller.text,
                            true,
                            "admin");
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/homeadmin", (route) => false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2b3258)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "--------------------------or-------------------------",
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 40,
                width: 350,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2b3258)),
                  child: const Text(
                    'Already have an account ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
