import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: const Text(
            "UserType",
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Material(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Select User Type",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Student Login",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Admin Login",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Guest Login",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
