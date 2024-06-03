import 'package:chat/controller/firbase_provider.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.service,
    required this.size,
  }) : super(key: key);

  final AuthService service;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvider>(builder: (context, value, child) {
      return ListView.builder(
        controller: value.scrollController,
        itemCount: value.messages.length,
        itemBuilder: (context, index) {
          final chats = value.messages[index];
          DateTime dateTime = chats.time!.toDate();
          String formattedTime = DateFormat.jm().format(dateTime);

          var alignment =
              chats.senderId == service.firebaseAuth.currentUser!.uid
                  ? Alignment.centerRight
                  : Alignment.centerLeft;
          var bubblecolor =
              chats.senderId == service.firebaseAuth.currentUser!.uid
                  ? Colors.white
                  : Colors.grey
                      .withOpacity(0.4); // Change to grey for opposite user

          var borderradius =
              chats.senderId == service.firebaseAuth.currentUser!.uid
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15))
                  : const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15));

          if (chats.messagetype == "text") {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Align(
                alignment: alignment,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.05,
                    minWidth: size.width * 0.2,
                    maxWidth: size.width * 0.7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bubblecolor,
                      borderRadius: borderradius,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            chats.content!,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Align(
                alignment: alignment,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.05,
                    minWidth: size.width * 0.2,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bubblecolor,
                      borderRadius: borderradius,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                                  .withOpacity(0.2), // Placeholder color
                            ),
                            child: Image.network(
                              chats.content!,
                              height: 300,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      );
    });
  }
}
