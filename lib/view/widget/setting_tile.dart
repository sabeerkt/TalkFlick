import 'package:chat/view/profile.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatefulWidget {
  const SettingTile({
    Key? key,
    required this.name,
    required this.image,
    required this.subtile,
  }) : super(key: key);

  final String name;
  final String image;
  final String subtile;

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
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
      subtitle: Text(
        widget.subtile,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
