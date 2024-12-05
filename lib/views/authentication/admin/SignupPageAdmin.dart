// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/admin/LoginPageAdmin.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    confirmpasscontroller.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b3258),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "Create an Account, it's free",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: screenHeight * 0.05),
                buildTextField(
                  controller: namecontroller,
                  labelText: "Name",
                  icon: Icons.people,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                buildTextField(
                  controller: emailcontroller,
                  labelText: "Email",
                  icon: Icons.mail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                buildTextField(
                  controller: passwordcontroller,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    } else if (value.length < 8) {
                      return "Password should be at least 8 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                buildTextField(
                  controller: confirmpasscontroller,
                  labelText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordcontroller.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                buildButton(
                  text: "Sign Up",
                  onPressed: () {
                    if (_formkey.currentState!.validate() &&
                        emailcontroller.text.split('@')[1] ==
                            'vitbhopal.ac.in') {
                      authServices.signupuser(
                        emailcontroller.text,
                        passwordcontroller.text,
                        namecontroller.text,
                        true,
                        "admin",
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/homeadmin", (route) => false);
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "--------------------------or-------------------------",
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(height: screenHeight * 0.03),
                buildButton(
                  text: "Already have an account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage2()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff2b3258)),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: Icon(icon, color: const Color(0xff2b3258)),
        ),
        validator: validator,
      ),
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2b3258),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
