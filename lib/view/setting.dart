import 'package:chat/view/profile.dart';
import 'package:chat/view/widget/setting_tile.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: Stack(
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Setting",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0xFF292F3F),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(left: 25),
                  children: [
                    SettingTile(
                      image: "assets/speak.png",
                      name: "username",
                      subtile: "bio",
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: SettingTile(
                        image: "assets/speak.png",
                        name: "account",
                        subtile: "securty , change number ",
                      ),
                    ),
                    SettingTile(
                      image: "assets/speak.png",
                      name: "help",
                      subtile: "helpcentre",
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
