// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/student/LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final registrationcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 70),
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
                            width: 3,
                            color: Color.fromARGB(
                                255, 100, 103, 102)), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      prefixIcon: Icon(
                        Icons.people,
                        color: Color.fromARGB(255, 30, 30, 31),
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
                            width: 3,
                            color:
                                Color.fromARGB(255, 88, 90, 89)), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 24, 24, 24),
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
                  controller: registrationcontroller,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color:
                                Color.fromARGB(255, 80, 81, 80)), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Registration",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 29, 28, 29),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Registration Number';
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
                                width: 3,
                                color: Color.fromARGB(255, 92, 94, 93)),
                          ),
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
                    controller: confirmpasswordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromARGB(
                                  255, 84, 86, 85)), //<-- SEE HERE
                        ),
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
                      onPressed: () => {
                            if (_formKey.currentState!.validate() &&
                                ((emailcontroller.text.split('@'))[1] ==
                                    'vitbhopal.ac.in'))
                              {
                                authServices.signupuser(
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                    namecontroller.text,
                                    false,
                                    registrationcontroller.text),
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/login", (route) => false)
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
                            builder: (context) => const LoginPage()),
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
      ),
    );
  }
}
