// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/authentication/admin/LoginPageAdmin.dart';
import 'package:flutter_application_1/views/authentication/student/LoginPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isStudentLoading = false;
  bool isAdminLoading = false;

  Future<void> navigateWithLoading(
      BuildContext context, Widget targetPage, Function setLoading) async {
    setLoading(true);

    await Future.delayed(const Duration(milliseconds: 1500));

    setLoading(false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2b3258),
        title: const Text(
          "Select UserType",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use constraints to adapt layouts
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/ert.png",
                    width: isLandscape ? screenWidth * 0.25 : screenWidth * 0.5,
                    height:
                        isLandscape ? screenHeight * 0.2 : screenHeight * 0.2,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildUserCard(
                    context,
                    "Complaint Box For Student",
                    "With Responsive and Fresh Look and Feel",
                    const LoginPage(),
                    isStudentLoading,
                    (value) => setState(() {
                      isStudentLoading = value;
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildUserCard(
                    context,
                    "Complaint Box For Admin",
                    "With more information about Complaint",
                    const LoginPage2(),
                    isAdminLoading,
                    (value) => setState(() {
                      isAdminLoading = value;
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildUserCard(BuildContext context, String title, String description,
      Widget targetPage, bool isLoading, Function(bool) setLoading) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(255, 31, 10, 186), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff2b3258)),
          ),
          const Divider(),
          Text(
            description,
            style: const TextStyle(
                color: Color.fromARGB(255, 12, 3, 132), fontSize: 16),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null // Disable the button while loading
                  : () => navigateWithLoading(context, targetPage, setLoading),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2b3258),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
