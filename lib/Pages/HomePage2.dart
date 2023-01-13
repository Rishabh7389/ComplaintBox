import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Complaint",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 750,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
