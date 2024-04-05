import 'package:chat/model/group_model.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/view/chat_page.dart';
import 'package:chat/view/grpchatpage.dart';
import 'package:flutter/material.dart';

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

class _Group_messageState extends State<Group_message> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.image),
      ),
      title: Text(
        widget.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        
        UserModel user = UserModel(name: widget.name);
       //  UserModel uid = UserModel(name: widget.name);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupchatPage(user: user,
            groupId:widget.name ,
            ),
            ));
      },
    );
  }
}
