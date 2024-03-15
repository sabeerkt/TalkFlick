import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool
      showVisibilityToggle; // New parameter to control the visibility toggle icon

  const TextForm({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.showVisibilityToggle =
        true, // Default value to show the visibility toggle icon
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText:
            !obscureText, // Reversed to show the text when obscureText is true
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: const Color.fromARGB(255, 230, 219, 219),
          filled: true,
          hintText: widget.hinttext,
          // Only show the icon if showVisibilityToggle is true
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
