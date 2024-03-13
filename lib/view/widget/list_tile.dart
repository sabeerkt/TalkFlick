import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    Key? key,
    required this.name,
    required this.image,
    required this.time,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String image;
  final String time;

  final String subtitle;
  final VoidCallback? onTap;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
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
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              widget.subtitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
           widget. time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ), // Replace with your logic to display the correct day
        ],
      ),
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
    );
  }
}
