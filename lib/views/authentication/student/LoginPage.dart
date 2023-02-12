import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/student/SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool _showPwd = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/images/student.jpg",
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Welcome ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Hostellers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email ",
                  prefixIcon: Icon(Icons.mail)),
              onChanged: (value) {
                name = value;
                setState(() {});
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Email");
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter password";
                  } else if (value.length < 8) {
                    return "Password should be atleast 8";
                  }
                  return null;
                }),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              height: 50,
              width: 420,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authServices.signInUser(
                        emailcontroller.text, passwordcontroller.text);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 110, 24, 222)),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )),
          const SizedBox(
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
          const Text(
            "--------------------------or-------------------------",
            style: TextStyle(fontSize: 19),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              width: 300,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 161, 36)),
                child: const Text(
                  'Create new CB account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )),
        ],
      ),
    ));
  }
}
