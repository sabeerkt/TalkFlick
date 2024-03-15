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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10.0), // Set your desired border radius here
        child: Container(
          color: Color.fromARGB(
              255, 89, 88, 111), // Set your desired background color here
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(widget.image),
            ),
            title: Text(
              widget.name,
              style: TextStyle(
                color: Colors.black,
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
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.time,
                  style: TextStyle(
                    color: Colors.black,
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
          ),
        ),
      ),
    );
  }
}
