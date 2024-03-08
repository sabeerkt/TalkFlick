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
    GroupMessage(),
    const CallPage(),
    // chart(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: bottomBarPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Color.fromARGB(255, 34, 150, 186),
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            _buildNavItem("ChatRoom", Icons.chat, 0),
            _buildNavItem("GroupMessage", Icons.group, 1),
            _buildNavItem("CallPage", Icons.call, 2),
            // _buildNavItem("Chart", Icons.pie_chart, 3),
            _buildNavItem("Setting", Icons.settings, 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, IconData icon, int index) {
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
        child: Icon(
          icon,
          color: _currentIndex == index
              ? Color.fromARGB(255, 34, 150, 186)
              : Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}