import 'package:chat/controller/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package
import 'package:chat/view/login.dart'; // Assuming LoginPage is imported from this path
import 'package:chat/constant/const.dart';
import 'package:provider/provider.dart';

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

  bool _isCreatingAccount = false; // Updated variable name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Welcome to!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 1.2,
                            color: Color.fromARGB(255, 180, 72, 72),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          "TalkFlick ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 1.2,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ],
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
                      controller: passwordController,
                    ),
                    TextForm(
                      hinttext: 'Confirm password',
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 10),
                    Consumer<AuthProviders>(
                      builder: (context, value, child) => Button(
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
                              _isCreatingAccount = true;
                            });
                            // Call signUpWithEmail with parameters
                            value
                                .signUpWithEmail(
                                    email, password, "$firstName $lastName")
                                .then((result) {
                              if (result != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to create account.'),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                              setState(() {
                                _isCreatingAccount = false;
                              });
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error.toString()),
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              setState(() {
                                _isCreatingAccount = false;
                              });
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Replace this with the action you want to take when the user already has an account
                            // For example, you can navigate to a login screen.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: 'Already have an account? ', // Changed text
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                                fontSize: 15, // Adjust font size as needed
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login', // Changed text
                                  style: TextStyle(
                                    color:
                                        Colors.blue, // Set text color to blue
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: 100,
                  child: _isCreatingAccount
                      ? Lottie.asset(
                          'assets/ac created.json',
                          width: 300,
                          height: 350,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
