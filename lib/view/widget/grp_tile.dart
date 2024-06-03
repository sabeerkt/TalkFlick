import 'package:flutter/material.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/view/grpchatpage.dart';

class Group_message extends StatefulWidget {
  const Group_message({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  State<Group_message> createState() => _Group_messageState();
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return "";
  return text[0].toUpperCase() + text.substring(1);
}

class _Group_messageState extends State<Group_message> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserModel user = UserModel(name: widget.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupchatPage(
              user: user,
              groupId: widget.name,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(widget.image),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalizeFirstLetter(widget.name),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Subtitle or additional information", // Provide additional info here if needed
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
