import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({Key? key}) : super(key: key);

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25, // Set the radius of the circular image
        backgroundImage:
            AssetImage('assets/chat.png'), // Replace with your image
      ),
      title: const Text(
        'Username',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Row(
        children: [
          Expanded(
            child: Text(
              'Recent message in a single line',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Today',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ), // Replace with your logic to display the correct day
        ],
      ),
      onTap: () {
        // Handle the onTap action
      },
    );
  }
}
