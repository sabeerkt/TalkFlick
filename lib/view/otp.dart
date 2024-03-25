import 'package:chat/constant/const.dart';
import 'package:chat/controller/auth_provider.dart';
import 'package:chat/view/widget/bottombar.dart';
import 'package:chat/view/widget/Custom_Phone_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationid, this.email, this.name});

  final String verificationid;
  final String? name;
  final String? email;
  final TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Otp",
                      style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'verification',
                    style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: [
                  Text(
                    'Enter the verification code we just sent on your',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'phonenumber',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Pinput(
                controller: otpcontroller,
                length: 6,
                showCursor: true,
                defaultPinTheme: const PinTheme(
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButtonPhone(
              onPressed: () {
                verifyOtp(context);
              },
              size: size,
              buttonname: "Verify otp",
            ),
          ],
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context) {
    Provider.of<AuthProviders>(context, listen: false)
        .verifyOtp(verificationid, otpcontroller.text, () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ));
    }, name!, email!);
  }
}
