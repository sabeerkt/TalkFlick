import 'package:chat/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PhoneOtp extends StatefulWidget {
  const PhoneOtp({super.key});

  @override
  State<PhoneOtp> createState() => _PhoneOtpState();
}

class _PhoneOtpState extends State<PhoneOtp> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/ottpp.json', // Replace with the actual path or asset name
          ),
          const SizedBox(
              height: 20), // Add some space between image and text field
          // Text field goes below the image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
              height: 20), // Add some space between text field and button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                //phoneSignIn();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Change the text color as needed
                padding:
                    const EdgeInsets.all(16.0), // Add padding to the button
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the border radius
                ),
                minimumSize: const Size(
                    double.infinity, 0), // Make the button take full width
              ),
              child: const Text(
                "Sent OTP",
                style:
                    TextStyle(fontSize: 18), // Adjust the font size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
