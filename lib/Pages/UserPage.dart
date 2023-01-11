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
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
              child: Column(children: [
                Text(
                  "Student Login",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Container(
                    height: 50,
                    width: 400,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 110, 24, 222)),
                    )),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    "Admin Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Container(
                      height: 50,
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 110, 24, 222)),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 3, 225, 237), width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    "Admin Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Container(
                      height: 50,
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 110, 24, 222)),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
