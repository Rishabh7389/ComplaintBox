import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/Pages/LoginPage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 100),
          Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 147, 19, 198)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Create an Accont,its free",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 80,
            width: 350,
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            width: 350,
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password"),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 50,
              width: 330,
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
              width: 350,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'Already have an account ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 31, 161, 36)),
              )),
        ],
      ),
    );
  }
}
