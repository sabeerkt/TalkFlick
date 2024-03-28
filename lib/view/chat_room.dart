import 'package:chat/constant/const.dart';
import 'package:chat/controller/auth_provider.dart';
import 'package:chat/controller/firbase_provider.dart';
import 'package:chat/view/chat_page.dart';
import 'package:chat/view/widget/conatctlist.dart';
import 'package:chat/view/widget/list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  void initState() {
    super.initState();
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: bgColor,
      //   leading: Consumer<AuthProviders>(
      //     builder: (context, value, child) => IconButton(
      //         onPressed: () {
      //           value.signOut();
      //         },
      //         icon: Icon(Icons.exit_to_app)),
      //   ),
      // ),
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/man (1).png'),
                ),
                SizedBox(width: 15),
                Text(
                  "Martina Wolna",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<FirebaseProvider>(
                      builder: (context, values, child) => TextFormField(
                        onChanged: (value) {
                          values.searchUser(value);
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: const Color.fromRGBO(102, 106, 179, 1),
                            hintText: 'Search ',
                            prefixIcon: const Icon(Icons.abc)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/searchneew.png"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chat Room",
                  style: GoogleFonts.zillaSlab(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactList()),
                    );
                  },
                  child: Text(
                    "New User",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<FirebaseProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.searchedusers.length,
                  itemBuilder: (context, index) {
                    final userdetails = value.searchedusers[index];

                    if (userdetails.uid !=
                        FirebaseAuth.instance.currentUser?.uid) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Color.fromARGB(75, 255, 255, 255),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChatPage(user: userdetails),
                                  )),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    'assets/man (1).png',
                                  ),
                                ),
                                title: Text(
                                  userdetails.name!,
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: const Text(
                                  " Tap to Chat",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 248, 248, 248)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Divider(
                              height: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
