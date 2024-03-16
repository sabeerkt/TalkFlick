import 'package:chat/constant/const.dart';
import 'package:chat/view/chat_page.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
        itemCount: 10, // Number of new users
        itemBuilder: (BuildContext context, int index) {
          String userName = "User $index";

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
                title: Text(
                  userName,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Add button logic here
                    // For example, you can show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Add $userName as a contact'),
                      ),
                    );
                  },
                  child: const Text('Add'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
