// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/authentication/admin/LoginPageAdmin.dart';
import 'package:flutter_application_1/views/authentication/student/LoginPage.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2b3258),
        title: const Text(
          "Select UserType",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/ert.png",
                width: 150,
                height: 140,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 31, 10, 186), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  const Text(
                    "Complaint Box For Student ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2b3258)),
                  ),
                  const Text(
                    "-----------------------------------------------------------------------",
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "With Responsive and Fresh Look and Feel",
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 3, 132),
                            fontSize: 16),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      height: 50,
                      width: 400,
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
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 31, 10, 186), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Complaint Box For Admin ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2b3258)),
                    ),
                    const Text(
                        "-----------------------------------------------------------------------"),
                    Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "With more information about Complaint",
                          style: TextStyle(
                              color: Color.fromARGB(255, 12, 3, 132),
                              fontSize: 16),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        height: 50,
                        width: 400,
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
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
