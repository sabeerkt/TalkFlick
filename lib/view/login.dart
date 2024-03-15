import 'package:flutter/material.dart';
import 'package:chat/constant/const.dart';
import 'package:chat/view/forgot_password.dart';
import 'package:chat/view/phone.dart';
import 'package:chat/view/spalsh.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:chat/view/widget/tile.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Declare controllers for username and password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggingIn = false; // Variable to track login process

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome back!\nTalkFlick to see you, Again!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30, // Adjusted font size
                      letterSpacing:
                          1.2, // Increased letter spacing for better readability
                      color: Colors.white, // Set the text color to white
                      height: 1.5, // Increased line height for better spacing
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Stack(
                  alignment:
                      Alignment.center, // Align Lottie animation at the center
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextForm(
                          hinttext: 'Email',
                          //obscureText: true,
                          controller: emailController,
                          showVisibilityToggle: false,
                        ),
                        TextForm(
                          hinttext: 'Password',
                          //  obscureText: true,
                          controller: passwordController,
                        ),
                      ],
                    ),
                    // Lottie animation shown when logging in
                    _isLoggingIn
                        ? Lottie.asset(
                            'assets/login sucedss.json', // Adjust the path to your animation
                            width: 150,
                            height: 150,
                          )
                        : Container(), // Empty container if not logging in
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot your password ?",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Button(
                  color: Colors.black,
                  name: "Login",
                  onTap: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    // Check if email or password is empty
                    if (email.isEmpty || password.isEmpty) {
                      // Show a snackbar centered on the screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all fields.'),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior
                              .floating, // Center the snackbar on the screen
                        ),
                      );
                    } else {
                      setState(() {
                        _isLoggingIn = true; // Start login process
                      });
                      // Simulate a login process (replace this with actual login logic)
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ),
                        );
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        endIndent: 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "or login with",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneOtp(),
                          ),
                        );
                      },
                      child: SqureTile(
                        imagePath: "assets/telephone-call.png",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SqureTile(
                      imagePath: "assets/gmail.png",
                    ),
                  ],
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
