import 'package:flutter/material.dart';

class LoginText extends StatefulWidget {
  const LoginText({super.key});

  @override
  State<LoginText> createState() => _LoginTextState();
}

class _LoginTextState extends State<LoginText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Welcome back!\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: "TalkFlick",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 1.2,
                  color: Colors.red,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: " to see you, Again!",
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
        ));
  }
}
