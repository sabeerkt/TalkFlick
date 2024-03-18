import 'package:chat/constant/const.dart';
import 'package:chat/view/chat_page.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<String> users = List.generate(10, (index) => "User $index");
  List<bool> isNew = List.filled(10, false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      isNew[i] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor, // Example color, change as needed
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: bgColor, // Example color, change as needed
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          String userName = users[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(
                      user: '',
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/user.png"),
                ),
                title: Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        color: isNew[index] ? Colors.green : Colors.white,
                      ),
                    ),
                    if (isNew[index]) // Display "New" badge if the user is new
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _handleChatButtonClick(userName);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 3,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleChatButtonClick(String userName) {
    // Implement your logic when the Chat button is clicked.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Start chatting with $userName'),
      ),
    );
  }
}
