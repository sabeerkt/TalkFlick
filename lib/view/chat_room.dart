import 'package:chat/view/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar color

    return Scaffold(
      backgroundColor: const Color(0xFF292F3F),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 15, // Set the radius of the circular image
                  backgroundImage:
                      AssetImage('assets/chat.png'), // Replace with your image
                ),
                SizedBox(width: 10),
                Text(
                  "Martina Wolna",
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 18, // Set the text size
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 177, 185, 207)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 96, 88,
                                88), // Set the background color of the TextField
                            hintText: "Search...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              MyListTile(),
              SizedBox(
                height: 10,
              ),
              MyListTile(),
              SizedBox(
                height: 10,
              ),
              MyListTile()
            ],
          )
        ],
      ),
    );
  }
}
