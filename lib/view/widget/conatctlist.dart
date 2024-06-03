import 'package:chat/constant/const.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/view/chat_page.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<UserModel> users = []; // Change the type to UserModel

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Call the method to fetch users on initialization
  }

  Future<void> fetchUsers() async {
    try {
      List<UserModel> userList = await AuthService().getAllUsers();
      setState(() {
        users = userList;
      });
    } catch (e) {
      print('Error fetching users: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          UserModel user = users[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(user: user),
                  ),
                );
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/user.png"),
                ),
                title: Text(
                  user.name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
