import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final bool isCurrentUser;

  const MessageTile(
      {Key? key, required this.message, required this.isCurrentUser})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: widget.isCurrentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: widget.isCurrentUser ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                widget.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
