import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage2.dart';
import 'package:flutter_application_1/Pages/SignupPage2.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final _formKey = GlobalKey<FormState>();
  moveToHome2(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage2()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
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
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Email");
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter password";
                  } else if (value.length < 8) {
                    return "Password should be atleast 8";
                  }
                  return null;
                },
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
                    onPressed: () => moveToHome2(context),
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage2()));
                  },
                  child: Text(
                    'Create new CB account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
