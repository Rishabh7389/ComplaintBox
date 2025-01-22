import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/authentication/admin/OtpAdmin.dart';

class Forgotpassadmin extends StatefulWidget {
  const Forgotpassadmin({super.key});

  @override
  State<Forgotpassadmin> createState() => _ForgotpassadminState();
}

class _ForgotpassadminState extends State<Forgotpassadmin> {
  final emailController = TextEditingController();
  bool _isLoading = false; // To show loading indicator when sending OTP
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // Function to simulate sending OTP
  void sendOtp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show loader when sending OTP
      });

      // Simulate network call with a delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false; // Hide loader after OTP is sent
        });
        // After OTP is sent, show a confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent to ${emailController.text}')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 73, 76, 78))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Use Form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Enter your registered email address to receive an OTP",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Email TextField with validation
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Color(0xff2b3258)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff2b3258), width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address'; // Validation for empty email
                  }
                  // Additional email validation (basic format check)
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null; // If email is valid
                },
              ),
              const SizedBox(height: 20),
              // Send OTP Button
              _isLoading
                  ? const CircularProgressIndicator() // Show loader if _isLoading is true
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Otpadmin()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2b3258),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50),
                      ),
                      child: const Text(
                        "Send OTP",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
