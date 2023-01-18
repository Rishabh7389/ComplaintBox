import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/LoginPage2.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Complaints",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 31, 10, 186), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage2(),
                        ));
                  },
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
