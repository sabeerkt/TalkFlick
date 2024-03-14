import 'package:chat/constant/const.dart';
import 'package:chat/view/login.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoggingIn = false;

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  controller: firstNameController,
                ),
                TextForm(
                  hinttext: 'Last name',
                  controller: lastNameController,
                ),
                TextForm(
                  hinttext: 'Email',
                  controller: emailController,
                ),
                TextForm(
                  hinttext: 'Password',
                  //obscureText: true,
                  controller: passwordController,
                ),
                TextForm(
                  hinttext: 'Confirm password',
                  // obscureText: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 10),
                Button(
                  color: Colors.black,
                  name: "Create Account",
                  onTap: () {
                    String firstName = firstNameController.text.trim();
                    String lastName = lastNameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword =
                        confirmPasswordController.text.trim();

                    if (firstName.isEmpty ||
                        lastName.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all fields.'),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Passwords do not match.'),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      setState(() {
                        _isLoggingIn = true;
                      });
                      // Simulate a login process (replace this with actual login logic)
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      });
                    }
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
