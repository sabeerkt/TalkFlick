import 'package:chat/constant/const.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Set crossAxisAlignment to center
          mainAxisAlignment:
              MainAxisAlignment.center, // Set mainAxisAlignment to center
          children: [
            const Text(
              "Forgot Password? ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 1.2,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            const Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 1.2,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            Lottie.asset(
              'assets/forgt pswrd.json', // Replace with the actual path or asset name
            ),
            const SizedBox(height: 25),
            TextForm(
              hinttext: 'First name ',
              //  obscureText: true,
              controller: usernameController,
            ),
            const SizedBox(height: 10),
            Button(
              color: Colors.black,
              name: "CreateAccount",
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const LoginPage(),
                //   ),
                // );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
