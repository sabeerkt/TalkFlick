import 'package:chat/view/widget/circle_avatar.dart';
import 'package:flutter/material.dart';

Column callsTile(String name, String message, String filename, int msgCount,
    BuildContext context) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              UserAvatar(filename: filename),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  // backgroundImage: AssetImage("assets/call-user.png"),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: Colors.white,
                      )),
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  // backgroundImage: AssetImage("assets/call-user.png"),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
      // const Divider(
      //   indent: 70,
      //   height: 20,
      // )
      const SizedBox(
        height: 20,
      )
    ],
  );
}
