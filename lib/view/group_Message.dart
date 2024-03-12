import 'package:chat/view/widget/grp_tile.dart';
import 'package:chat/view/widget/list_tile.dart';
import 'package:flutter/material.dart';

class GroupMessage extends StatefulWidget {
  const GroupMessage({super.key});

  @override
  State<GroupMessage> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292F3F),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "GroupMessage",
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 18, // Set the text size
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue, // Set the background color here
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/chat.gif'),
                      ),
                      title: const Text(
                        'Create Groups',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Handle the onTap action
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Group_message(),
                SizedBox(
                  height: 10,
                ),
                Group_message(),
                SizedBox(
                  height: 10,
                ),
                Group_message()
              ],
            ),
          )
        ],
      ),
    );
  }
}
