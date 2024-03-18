import 'package:chat/constant/const.dart';
import 'package:chat/view/widget/MessageTile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, String? user}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: GestureDetector(
          onTap: () {},
          child: const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/user.png'),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Martina Wolna",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Active Now",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.phone,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle phone call action
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.videocam,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle video call action
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'block',
                child: ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Block User'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'clear',
                child: ListTile(
                  leading: Icon(Icons.clear),
                  title: Text('Clear Chat'),
                ),
              ),
            ],
            onSelected: (String value) {
              if (value == 'block') {
                // Handle block user action
              } else if (value == 'clear') {
                // Handle clear chat action
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => MessageTile(
                message: messages[index],
                isCurrentUser: index % 2 == 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromARGB(255, 234, 234, 234),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Type your message...',
                                border:
                                    InputBorder.none, // Remove default border
                                hintStyle: TextStyle(
                                    color: Colors.grey[600]), // Hint text color
                              ),
                              maxLines:
                                  null, // or any positive integer greater than 1
                              style: const TextStyle(
                                  color: Color.fromARGB(
                                      255, 0, 0, 0)), // Text color
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.attach_file),
                              onSelected: (value) {
                                // Handle menu item selection
                                if (value == 'camera') {
                                  // Handle camera action
                                } else if (value == 'video') {
                                  // Handle video action
                                } else if (value == 'location') {
                                  // Handle location action
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  {
                                    'label': 'Camera',
                                    'image': 'assets/camera.png'
                                  },
                                  {
                                    'label': 'Video',
                                    'image': 'assets/video-calling.png'
                                  },
                                  {
                                    'label': 'Location',
                                    'image': 'assets/map.png'
                                  },
                                ].map((Map<String, dynamic> choice) {
                                  return PopupMenuItem<String>(
                                    value: choice['label'].toLowerCase(),
                                    child: ListTile(
                                      leading: Image.asset(
                                        choice['image'],
                                        width:
                                            24.0, // Adjust the width as needed
                                        height:
                                            24.0, // Adjust the height as needed
                                      ),
                                      title: Text(choice['label']),
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                if (_messageController.text.isNotEmpty) {
                                  setState(() {
                                    messages.add(_messageController.text);
                                    _messageController.clear();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
