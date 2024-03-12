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
                                return ['Camera', 'Video', 'Location']
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice.toLowerCase(),
                                    child: Text(choice),
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

class MessageTile extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  MessageTile({required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
