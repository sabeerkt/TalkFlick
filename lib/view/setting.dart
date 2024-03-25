import 'package:flutter/material.dart';
import 'package:chat/view/profile.dart';
import 'package:chat/view/widget/setting_tile.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: Stack(
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Setting",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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
                  topRight: Radius.circular(40),
                ),
                color: Color(0xFF292F3F),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100, // Set your desired height
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const ListTile(
                          tileColor:
                              Colors.blue, // Set your desired background color
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                Colors.white, // Set your desired color
                            backgroundImage: AssetImage("assets/persn 1.png"),
                          ),
                          title: Text(
                            'Nazrual islam',
                            style: TextStyle(
                              color:
                                  Colors.yellow, // Set your desired text color
                              fontWeight: FontWeight.bold,
                              fontSize: 25, // Set your desired font size
                            ),
                          ),
                          subtitle: Text(
                            'never give up',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle
                                  .italic, // Set your desired text style
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
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
                    child: const SettingTile(
                      image: "assets/user.png",
                      name: "Account",
                      subtile: "change username  profile  Bio ",
                    ),
                  ),
                  const SettingTile(
                    image: "assets/help.png",
                    name: "help",
                    subtile: "HelpCentre ",
                  ),
                  SettingTile(
                    image: "assets/delete-friend.png",
                    name: "Delete Account",
                    subtile: "Delete",
                    onTap: _showDeleteAccountDialog,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
