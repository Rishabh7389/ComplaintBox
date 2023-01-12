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
            "Welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Admin",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email")),
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
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              width: 390,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 110, 24, 222)),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
          SizedBox(
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
          Text(
            "--------------------------or-------------------------",
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 31, 161, 36)),
                onPressed: () {},
                child: Text(
                  'Create new CB account',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}
