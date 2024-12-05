import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/authentication/admin/SignupPageAdmin.dart';
import '../../../constant/services/auth_service.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                  child: Image.asset(
                    "assets/images/studentq.jpg",
                    width: screenWidth * 1,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "ＷＥＬＣＯＭＥ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2b3258)),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  "ＡＤＭＩＮ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2b3258)),
                ),
                SizedBox(height: screenHeight * 0.02),
                buildTextField(
                  controller: emailcontroller,
                  labelText: "Email",
                  icon: Icons.mail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
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
                SizedBox(height: screenHeight * 0.03),
                buildButton(
                  text: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authServices.signInUser(emailcontroller.text,
                          passwordcontroller.text, context, true);
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
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
                SizedBox(height: screenHeight * 0.02),
                buildButton(
                  text: "Create new CB account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage2()),
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
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xff2b3258)),
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
