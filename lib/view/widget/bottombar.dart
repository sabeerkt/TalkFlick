// Import the 'dart:ui' library to use the 'Image' class.
import 'dart:ui' as ui;

import 'package:chat/view/call.dart';
import 'package:chat/view/chat_room.dart';
import 'package:chat/view/group_Message.dart';

import 'package:chat/view/setting.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    ChatRoom(),
   // GroupHome(),
   GroupMessage(),
    const CallPage(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: bottomBarPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: ui.Color.fromARGB(255, 97, 95, 128),
        selectedItemColor: Color.fromARGB(255, 34, 150, 186),
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          _buildNavItem("ChatRoom", 'assets/chatroom.png', 0),
          _buildNavItem("GroupMessage", 'assets/groupmsg.png', 1),
          _buildNavItem("CallPage", 'assets/phone-call.png', 2),
          _buildNavItem("Setting", 'assets/setting.png', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, String imagePath, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        decoration: BoxDecoration(
          border: _currentIndex == index
              ? const Border(
                  top: BorderSide(
                      width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                )
              : null,
        ),
        child: Image.asset(
          imagePath,
          width: 24.0, // Adjust the width as needed
          height: 24.0, // Adjust the height as needed
        ),
      ),
    );
  }
}
