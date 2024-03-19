import 'package:chat/view/widget/cal_tile.dart';

import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: Stack(
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Calls",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0xFF292F3F),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    // padding: const EdgeInsets.only(left: 25),
                    children: [
                      callsTile('Laura', 'Today, 09:30 AM',
                          'assets/man (1).png', 0, context),
                      callsTile('Kalya', 'Yesterday, 09:30 AM',
                          'assets/man (1).png', 2, context),
                      callsTile('Mary', 'Monday, 09:30 AM',
                          'assets/man (1).png', 6, context),
                      callsTile('Hellen', 'Today, 09:30 AM',
                          'assets/man (1).png', 0, context),
                      callsTile('Louren', 'Today, 09:30 AM',
                          'assets/man (1).png', 3, context),
                      callsTile('Tom', 'Sunday, 09:30 AM', 'assets/man (1).png',
                          0, context),
                      callsTile('Laura', 'Today, 09:30 AM',
                          'assets/man (1).png', 0, context),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
