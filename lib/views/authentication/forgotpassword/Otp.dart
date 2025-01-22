import 'package:flutter/material.dart';

class Otpadmin extends StatefulWidget {
  const Otpadmin({super.key});

  @override
  State<Otpadmin> createState() => _OtpadminState();
}

class _OtpadminState extends State<Otpadmin> {
  // Controllers for each OTP digit input field
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();
  final otpController5 = TextEditingController();
  final otpController6 = TextEditingController();

  // Focus nodes to move between fields automatically
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();

  // Function to handle OTP submission
  void submitOtp() {
    // Combine all OTP digits into a single string
    String otp = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text +
        otpController5.text +
        otpController6.text;

    if (otp.length == 6) {
      // Proceed with OTP verification (for now, we just print it)
      print("OTP entered: $otp");

      // Navigate to another page if necessary
      // Example: Navigator.pushNamed(context, "/nextPage");
    } else {
      // Show a message if OTP is incomplete
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the complete OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 73, 76, 78))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Enter the 6-digit OTP sent to your email",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Row for OTP Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOtpTextField(
                    controller: otpController1,
                    focusNode: focusNode1,
                    nextFocusNode: focusNode2),
                buildOtpTextField(
                    controller: otpController2,
                    focusNode: focusNode2,
                    nextFocusNode: focusNode3),
                buildOtpTextField(
                    controller: otpController3,
                    focusNode: focusNode3,
                    nextFocusNode: focusNode4),
                buildOtpTextField(
                    controller: otpController4,
                    focusNode: focusNode4,
                    nextFocusNode: focusNode5),
                buildOtpTextField(
                    controller: otpController5,
                    focusNode: focusNode5,
                    nextFocusNode: focusNode6),
                buildOtpTextField(
                    controller: otpController6, focusNode: focusNode6),
              ],
            ),
            const SizedBox(height: 30),
            // Submit Button
            ElevatedButton(
              onPressed: submitOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2b3258),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: const Text(
                "Submit OTP",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create OTP text fields
  Widget buildOtpTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? nextFocusNode,
  }) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // Restrict to 1 character per field
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff2b3258)),
          ),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          // Move to the next field when a digit is entered
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        onEditingComplete: () {
          // Automatically move to the next field
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
      ),
    );
  }
}
