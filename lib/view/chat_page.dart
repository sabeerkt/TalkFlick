import 'package:chat/constant/const.dart';
import 'package:chat/controller/basic_provider.dart';
import 'package:chat/controller/firbase_provider.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/service/chat/chat_service.dart';
import 'package:chat/view/widget/MessageTile.dart';
import 'package:chat/view/widget/imageselctrdlg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ChatBubble(service: service, size: size),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // Chat input field
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
      await ChatService()
          .sendMessage(widget.user.uid!, messagecontroller.text, "text");
      messagecontroller.clear();
    }
  }
}
