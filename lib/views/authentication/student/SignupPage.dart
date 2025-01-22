import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/services/auth_service.dart';
import 'package:flutter_application_1/views/authentication/student/LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final registrationcontroller = TextEditingController();

  bool _isPasswordVisible = false; // State for password visibility
  bool _isConfirmPasswordVisible =
      false; // State for confirm password visibility

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    namecontroller.dispose();
    registrationcontroller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b3258)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Create an Account, it's free",
                style: TextStyle(),
              ),
              const SizedBox(
                height: 40,
              ),
              // Name Field
              buildTextField(
                controller: namecontroller,
                labelText: "Name",
                icon: Icons.people,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email Field
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
              const SizedBox(height: 20),

              // Registration Number Field
              buildTextField(
                controller: registrationcontroller,
                labelText: "Registration Number",
                icon: Icons.assignment_ind,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Registration Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Field
              buildPasswordField(
                controller: passwordcontroller,
                labelText: "Password",
                obscureText: !_isPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter password";
                  } else if (value.length < 8) {
                    return "Password should be at least 8 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password Field
              buildPasswordField(
                controller: confirmpasswordcontroller,
                labelText: "Confirm Password",
                obscureText: !_isConfirmPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
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
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        ((emailcontroller.text.split('@'))[1] ==
                            'vitbhopal.ac.in')) {
                      authServices.signupuser(
                        emailcontroller.text,
                        passwordcontroller.text,
                        namecontroller.text,
                        false,
                        registrationcontroller.text,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2b3258)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "--------------------------or-------------------------",
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 30),

              // Already have an account button
              Container(
                height: 40,
                width: 350,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2b3258)),
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build text fields
  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: 80,
      width: 350,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 92, 94, 93)),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 30, 30, 31)),
        ),
        validator: validator,
      ),
    );
  }

  // Function to build password fields with eye button
  Widget buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: 80,
      width: 350,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 92, 94, 93)),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: const Icon(Icons.lock, color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xff2b3258),
            ),
            onPressed: onToggleVisibility,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
