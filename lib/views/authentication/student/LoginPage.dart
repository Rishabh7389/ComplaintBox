import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/student/SignupPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool _isPasswordVisible = false; // State variable for password visibility

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
                    width: screenWidth * 1.8,
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
                const SizedBox(height: 10),
                const Text(
                  "ＳＴＵＤＥＮＴＳ",
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
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff2b3258),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
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
                buildButton(
                  "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // Show loading indicator (Optional)
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              Center(child: CircularProgressIndicator()),
                        );

                        // Call authentication service
                        await authServices.signInUser(
                          emailcontroller.text,
                          passwordcontroller.text,
                          context,
                          false,
                        );

                        // Dismiss loading indicator
                        Navigator.of(context).pop();
                      } catch (e) {
                        Navigator.of(context)
                            .pop(); // Dismiss loading if error occurs
                        Fluttertoast.showToast(
                            msg: "Check your Email and Password");
                      }
                    }
                  },
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
                SizedBox(height: screenHeight * 0.02),
                buildButton(
                  "Create new CB account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
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
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Color.fromARGB(255, 152, 155, 154)),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: Icon(icon, color: const Color(0xff2b3258)),
          suffixIcon: suffixIcon, // Added suffix icon for password visibility
        ),
        validator: validator,
      ),
    );
  }

  Widget buildButton(String text, {required VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2b3258),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
