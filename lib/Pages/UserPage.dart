import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          "UserType",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Material(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Select User Type",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
