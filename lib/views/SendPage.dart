// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/student/HomePage.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b3258),
      appBar: AppBar(
        backgroundColor: Color(0xff2b3258),
        title: Text(
          "Message Status",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/images/mess.png",
            height: 200,
            width: 350,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "'Thank you'",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          )),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Your Complaint Message",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Has Been Sent To Managemet",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Your Issue Will Resolve ",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "As Soon As Possible",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 22,
          ),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2b3258),
                      shadowColor: Color.fromARGB(255, 255, 255, 255)),
                  child: Text(
                    "Report Another Complaint",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
        ],
      ),
    );
  }
}
