import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Image.asset("assets/images/sent.png"),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "'Thank you'",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.pink),
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
                  color: Colors.purple),
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
                  color: Colors.blue),
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
                  color: Colors.green),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "As Soon As Possible",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    "Report Another Complaint",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.purple))),
        ],
      ),
    );
  }
}
