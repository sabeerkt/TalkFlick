import 'package:chat/view/profile.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatefulWidget {
  const SettingTile({
    Key? key,
    required this.name,
    required this.image,
    required this.subtile,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String image;
  final String subtile;
  final VoidCallback? onTap;

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap, // Add onTap to the ListTile
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
