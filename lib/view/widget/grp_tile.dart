import 'package:flutter/material.dart';

class Group_message extends StatefulWidget {
  const Group_message({super.key});

  @override
  State<Group_message> createState() => _Group_messageState();
}

class _Group_messageState extends State<Group_message> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25, // Set the radius of the circular image
        backgroundImage:
            AssetImage('assets/chat.gif'), // Replace with your image
      ),
      title: const Text(
        'Groups',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        // Handle the onTap action
      },
    );
  }
}
