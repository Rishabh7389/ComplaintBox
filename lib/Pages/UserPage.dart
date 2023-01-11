import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 55, 206),
        title: Center(
          child: const Text(
            "UserType",
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/user.png",
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 40,
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
                    "Complaint Box For Student ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    "-----------------------------------------------------------------------",
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "With Responsive and Fresh Look and Feel",
                        style:
                            TextStyle(color: Color.fromARGB(255, 15, 22, 220)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
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
                            primary: Color.fromARGB(255, 228, 76, 76)),
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
                      "Complaint Box For Admin ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                        "-----------------------------------------------------------------------"),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "With more information about Complaint",
                          style: TextStyle(
                              color: Color.fromARGB(255, 15, 22, 220)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
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
                              primary: Color.fromARGB(255, 55, 161, 188)),
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
                      "Complaint Box For Guest",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                        "-----------------------------------------------------------------------"),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Introduced with Transcript Services",
                          style: TextStyle(
                              color: Color.fromARGB(255, 15, 22, 220)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
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
                              primary: Color.fromARGB(255, 82, 195, 74)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
