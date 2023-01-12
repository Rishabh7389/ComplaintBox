import 'package:flutter/material.dart';

class ALoginPage extends StatelessWidget {
  const ALoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            child: Image.asset("assets/images/complain.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "WELCOME",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Admin",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email")),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
