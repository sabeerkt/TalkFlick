import 'package:chat/view/widget/MessageTile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292F3F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF292F3F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/chat.gif'),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Martina Wolna",
                  style: TextStyle(
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
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // Handle phone call action
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // Handle video call action
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
                      TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          fillColor: const Color.fromARGB(255, 113, 107, 107),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          // Add padding to the right side of the TextField
                          contentPadding: EdgeInsets.only(
                              right: 80.0), // Adjust the value as needed
                        ),
                        maxLines:
                            null, // or any positive integer greater than 1
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton<String>(
                              icon: Icon(Icons.attach_file),
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
                                    'image': 'assets/google.png'
                                  },
                                  {
                                    'label': 'Video',
                                    'image': 'assets/google.png'
                                  },
                                  {
                                    'label': 'Location',
                                    'image': 'assets/google.png'
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
                              icon: Icon(Icons.send),
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
