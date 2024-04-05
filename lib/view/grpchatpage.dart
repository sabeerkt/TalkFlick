import 'package:chat/constant/const.dart';
import 'package:chat/controller/basic_provider.dart';
import 'package:chat/controller/firbase_provider.dart';
import 'package:chat/model/group_model.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/service/chat/chat_service.dart';
import 'package:chat/service/group/group_service.dart';
import 'package:chat/view/grpchat/widgets/msg_tile.dart';
import 'package:chat/view/widget/MessageTile.dart';
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
  State<GroupchatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<GroupchatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messagecontroller = TextEditingController();
  AuthService service = AuthService();
  void initState() {
    super.initState();

    final currentUserId = service.firebaseAuth.currentUser!.uid;
    if (widget.user.uid != null) {
      Provider.of<FirebaseProvider>(context, listen: false)
          .getMessages(currentUserId, widget.user.uid!);
    }
  }

  List<String> messages = [];

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
                //backgroundImage: AssetImage('assets/user.png'),
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
      body: Stack(
        children: [
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messagecontroller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Send a message",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  chatMessages() {
    return StreamBuilder(
        stream: chats,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return MessageTile(
                        Message: snapshot.data.docs[i]['message'],
                        sender: snapshot.data.docs[i]['sender'],
                        sendByme:
                            widget.user == snapshot.data.docs[i]['sender']);
                  })
              : Container();
        });
  }

  sendMessage() {
    if (messagecontroller.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messagecontroller.text,
        "sender": widget.user,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService().sendMessagess(widget.groupId, chatMessageMap);
      setState(() {
        messagecontroller.clear();
      });
    }
  }
}
