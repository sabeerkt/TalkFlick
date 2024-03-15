import 'package:flutter/material.dart';

Column callsTile(
  String name,
  String message,
  String filename,
  int msgCount,
  BuildContext context,
) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(filename),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            Row(
              // Align the icons horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle the call action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 10), // Adjust spacing between icons if needed
                ElevatedButton(
                  onPressed: () {
                    // Handle the video call action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    Icons.videocam,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
      Divider(height: 1, color: Colors.grey), // Add a divider for separation
    ],
  );
}
