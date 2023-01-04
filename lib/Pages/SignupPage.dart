import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Text("Sign Up"),
          SizedBox(
            height: 10,
          ),
          Text("Create an Accont,its free"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Registration No."),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Hostel Name"),
              )),
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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 134, 20, 215)))),
        ],
      ),
    );
  }
}
