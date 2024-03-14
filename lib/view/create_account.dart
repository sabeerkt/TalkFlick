import 'package:chat/constant/const.dart';
import 'package:chat/view/login.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          // Wrap the Column with Center
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Set crossAxisAlignment to center
              mainAxisAlignment:
                  MainAxisAlignment.center, // Set mainAxisAlignment to center
              children: [
                const Text(
                  "Welcome to!\nTalkFlick ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                TextForm(
                  hinttext: 'First name ',
               //   obscureText: true,
                  controller: usernameController,
                ),
                TextForm(
                  hinttext: 'Second name',
                 // obscureText: true,
                  controller: usernameController,
                ),
                TextForm(
                  hinttext: 'Email',
                //  obscureText: true,
                  controller: emailController,
                ),
                TextForm(
                  hinttext: 'Password',
                //  obscureText: true,
                  controller: passwordController,
                ),
                TextForm(
                  hinttext: 'confirm password',
                //  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                Button(
                  color: Colors.black,
                  name: "CreateAccount",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
