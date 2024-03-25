import 'package:chat/constant/const.dart';
import 'package:chat/controller/auth_provider.dart';
import 'package:chat/view/widget/Custom_Phone_Button.dart';
import 'package:chat/view/widget/cutomtextfield.dart';
import 'package:chat/view/widget/phonefield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthProviders>(context, listen: false);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      //resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey',
                    style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Enter your phone',
                    style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text("to send otp!",
                      style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
                padding: const EdgeInsets.all(30),
                child: CustomPhoneField(phonecontroller: phonecontroller)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: CustomTextField(
                  icons: Icons.person,
                  hintText: "enter your name",
                  controller: namecontroller),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: CustomTextField(
                  icons: Icons.mail,
                  hintText: "enter your email",
                  controller: emailcontroller),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonPhone(
              onPressed: () {
                String countrycode = "+91";
                String phonenumber = countrycode + phonecontroller.text;
                if (phonenumber.length == 13) {
                  pro.signInWithPhone(phonenumber, namecontroller.text,
                      emailcontroller.text, context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a 10-digit phone number.'),
                    ),
                  );
                }
              },
              size: size,
              buttonname: "Send code",
            ),
          ],
        ),
      ),
    );
  }
}
