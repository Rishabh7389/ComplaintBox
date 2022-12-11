import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 34, 199)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an Account,Its free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 57, 54, 54),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Username"),
                          makeInput(label: "Password", obsureText: true),
                          makeInput(label: "Confirm Pasword", obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: .1, left: .1),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black))),
                        child: Container(
                            height: 50,
                            width: 800,
                            padding: const EdgeInsets.fromLTRB(.1, 0, .1, 0),
                            child: ElevatedButton(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 110, 24, 222)),
                            )),
                      ),
                    ),
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
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text(
                            'Already Have an account',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 31, 161, 36)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
