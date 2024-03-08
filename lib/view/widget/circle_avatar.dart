import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.transparent,
      child: CircleAvatar(
        radius: 29,
        backgroundColor: Colors.transparent,
        backgroundImage: Image.asset('assets/$filename').image,
      ),
    );
  }
}
