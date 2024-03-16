import 'package:chat/view/widget/button.dart';
import 'package:chat/view/widget/textform.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292F3F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF292F3F),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("assets/google.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextForm(
              controller: userNameController,
              hinttext: "username",
             // obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextForm(
              controller: bioController,
              hinttext: "Bio",
             // obscureText: true,
            ),
          ),
          Button(
            color: Colors.black,
            name: "Save",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SplashScreen(),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }
}
