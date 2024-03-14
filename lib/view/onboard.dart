import 'package:chat/constant/const.dart';
import 'package:chat/view/create_account.dart';
import 'package:chat/view/login.dart';
import 'package:chat/view/widget/button.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'TalkFlick',
          style: const TextStyle(
            color: Color.fromARGB(255, 148, 39, 39),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: bgColor, // Set the background color
      ),
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/spash post.png', // Replace with your actual image path
            height: 400,
            width: 300,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Button(
                  color: Colors.black,
                  name: "Login",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage()), // Remove the semicolon here
                    );
                  },
                ),
                const SizedBox(height: 10),
                Button(
                  color: Colors.white54,
                  name: "Register",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CreateAccount()), // Remove the semicolon here
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
