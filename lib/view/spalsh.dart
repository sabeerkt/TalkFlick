import 'package:chat/view/widget/bottombar.dart';
import 'package:chat/view/widget/button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: const Text(
                "Stay connected with your friends and family",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 1.2,
                  color: Colors.green, // Set the text color to white
                  height: 1.5,
                ),
              ),
            ),
          ),
          // Full-size image
          Image.asset(
            'assets/bgspalsh.png', // Replace with your image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Positioned column at the bottom center
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.1, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock, // Replace with your desired icon
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8), // Add some spacing
                    const Text(
                      "Secure, private messaging",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Add some spacing
                Button(
                  color: Colors.black,
                  name: "Get Started",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomBar(),
                      ),
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
