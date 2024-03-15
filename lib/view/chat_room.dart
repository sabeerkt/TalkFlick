import 'package:chat/constant/const.dart';
import 'package:chat/view/chat_page.dart';
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
      backgroundColor: bgColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors
                      .transparent, // Ensure the background is transparent
                  backgroundImage: AssetImage('assets/man (1).png'),
                ),
                SizedBox(width: 15),
                Text(
                  "Martina Wolna",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight:
                        FontWeight.bold, // Apply bold font weight for emphasis
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
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Color.fromARGB(255, 27, 26, 26),
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 247, 247, 247),
                            hintText: "Search...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(
                                  8.0), // Adjust padding as needed
                              child: Image.asset("assets/searchneew.png"),
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
              MyListTile(
                image: 'assets/persn 1.png',
                name: "Arya",
                subtitle: 'hai broo',
                time: "Today",
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                time: "yesterday",
                image: 'assets/persn 1.png',
                name: "John",
                subtitle: 'hai broo',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatPage(), // Replace YourNextPage with the actual widget for the next page
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                time: "yesterday",
                image: 'assets/persn 1.png',
                name: "Emma",
                subtitle: 'hai broo',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatPage(), // Replace YourNextPage with the actual widget for the next page
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
