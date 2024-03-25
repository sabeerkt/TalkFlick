import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/controller/auth_provider.dart';
import 'package:chat/view/create_account.dart';
import 'package:chat/view/phone_auth.dart';
import 'package:chat/view/widget/bottombar.dart';
import 'package:chat/view/widget/logintext.dart';
import 'package:chat/view/forgot_password.dart';
import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:chat/view/widget/tile.dart';
import 'package:lottie/lottie.dart';
import 'package:chat/constant/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const LoginText(),
                        const SizedBox(height: 25),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextForm(
                                  hinttext: 'Email',
                                  controller: emailController,
                                  showVisibilityToggle: false,
                                ),
                                TextForm(
                                  hinttext: 'Password',
                                  controller: passwordController,
                                ),
                              ],
                            ),
                            _isLoggingIn
                                ? Lottie.asset(
                                    'assets/login sucedss.json',
                                    width: 150,
                                    height: 150,
                                  )
                                : Container(),
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
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Consumer<AuthProviders>(
                          builder: (context, value, child) => Button(
                            color: Colors.black,
                            name: "Login",
                            onTap: () {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();

                              // Regular expression for email validation
                              RegExp emailRegExp =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                              if (!emailRegExp.hasMatch(email)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Invalid email format.'),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                return;
                              }

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in all fields.'),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else {
                                value.signInWithEmail(email, password, context);

                                setState(() {
                                  _isLoggingIn = true;
                                });

                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BottomBar(),
                                    ),
                                  );
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "or login with",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhoneAuthPage(),
                                  ),
                                );
                              },
                              child: const SqureTile(
                                imagePath: "assets/otppp.png",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Consumer<AuthProviders>(
                              builder: (context, value, child) => InkWell(
                                onTap: () async {
                                  await value.signUpWithGoogle();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BottomBar(),
                                    ),
                                  );
                                },
                                child: const SqureTile(
                                  imagePath: "assets/gmail.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CreateAccount(),
                                  ),
                                );
                              },
                              child: const Text.rich(
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: TextStyle(
                                    color:
                                        Colors.white, // Set text color to white
                                    fontSize: 15, // Adjust font size as needed
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Register Now',
                                      style: TextStyle(
                                        color:
                                            Colors.red, // Set text color to red
                                        fontWeight: FontWeight
                                            .bold, // Make the text bold
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: bgColor,
    );
  }
}
