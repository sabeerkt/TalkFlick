import 'package:flutter/material.dart';

class Group_message extends StatefulWidget {
  const Group_message({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String image;

  @override
  State<Group_message> createState() => _Group_messageState();
}

class _Group_messageState extends State<Group_message> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.image),
      ),
      title: Text(
        widget.name,
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
