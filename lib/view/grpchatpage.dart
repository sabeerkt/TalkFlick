import 'package:chat/constant/const.dart';
import 'package:chat/controller/basic_provider.dart';
import 'package:chat/controller/firbase_provider.dart';

import 'package:chat/model/user_model.dart';
import 'package:chat/service/auth/auth_service.dart';

import 'package:chat/service/group/group_service.dart';

import 'package:chat/view/widget/group_bubble.dart';
import 'package:chat/view/widget/imageselctrdlg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupchatPage extends StatefulWidget {
  const GroupchatPage({
    Key? key,
    required this.user,
    required this.groupId,
  }) : super(key: key);
  final UserModel user;
  final String groupId;

  @override
  State<GroupchatPage> createState() => _GroupchatPageState();
}

class _GroupchatPageState extends State<GroupchatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messagecontroller = TextEditingController();
  AuthService service = AuthService();

  @override
  void initState() {
    super.initState();
    initializeChats();
  }

  Future<void> initializeChats() async {
    final value = await DatabaseService().getChats(widget.groupId);
    setState(() {
      chats = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/user.png'),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Active Now",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
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
                value: 'add_user',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Add User'),
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
            onSelected: (String value) async {
              if (value == 'block') {
                // Handle block user action
              } else if (value == 'clear') {
                // Handle clear chat action
              } else if (value == 'add_user') {
                // Fetch all users
                final userpro =
                    Provider.of<FirebaseProvider>(context, listen: false)
                        .getAllUsers();

                // Show dialog to select user
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Select User to Add'),
                    content: Container(
                      width: double.minPositive,
                      height: 300.0,
                      child: ListView.builder(
                        itemCount: userpro.length,
                        itemBuilder: (context, index) {
                          final user = userpro[index];
                          return ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(user.name ?? ""),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add the selected user to the group
                                    DatabaseService().addUserToGroup(
                                        groupId: widget.groupId, user: user);
                                    Navigator.pop(context); // Close dialog
                                  },
                                  child: Text("Add"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: StreamBuilder(
                stream: chats,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            return MessageTile(
                              message: snapshot.data?.docs[index]['message'],
                              sender: snapshot.data?.docs[index]['sender'] ??
                                  "", // Use empty string if sender is null
                              sendByMe: widget.user.name ==
                                  snapshot.data?.docs[index]['sender'],
                              currentUserName: widget.user.name ??
                                  "", // Use empty string if user name is null
                            );
                          },
                        )
                      : Container();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final pro = Provider.of<BasicProvider>(context);
                                return ImageSelectorDialog(
                                  pro: pro,
                                  size: size,
                                  recieverId: widget.user.uid!,
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              controller: messagecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            sendMessage();
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Color.fromARGB(255, 5, 5, 5),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendMessage() async {
    if (messagecontroller.text.isNotEmpty) {
      await DatabaseService().sendMessagess(
        groupId: widget.groupId,
        chatMessageData: {
          "message": messagecontroller.text,
          "sender": widget.user.name,
          "time": DateTime.now().millisecondsSinceEpoch,
        },
      );
      messagecontroller.clear();
    }
  }
}
