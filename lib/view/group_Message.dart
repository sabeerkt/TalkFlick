import 'package:chat/view/widget/grp_tile.dart';
import 'package:flutter/material.dart';

class GroupMessage extends StatefulWidget {
  const GroupMessage({Key? key}) : super(key: key);

  @override
  State<GroupMessage> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessage> {
  TextEditingController _groupNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292F3F),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "GroupMessage",
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 18, // Set the text size
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Set the background color here
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/add-friend.png'),
                      ),
                      title: const Text(
                        'Create Groups',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Show dialog when tapped
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Create Group'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: _groupNameController,
                                    decoration: InputDecoration(
                                      labelText: 'Group Name',
                                    ),
                                  ),
                                  TextField(
                                    controller: _descriptionController,
                                    decoration: InputDecoration(
                                      labelText: 'Description',
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle saving functionality
                                    String groupName =
                                        _groupNameController.text;
                                    String description =
                                        _descriptionController.text;
                                    // Implement your logic to save the group
                                    // For demonstration, we print the group name and description
                                    print('Group Name: $groupName');
                                    print('Description: $description');
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Group_message(
                  image: "assets/teamwork.png",
                  name: "grp 1",
                ),
                const SizedBox(
                  height: 10,
                ),
                Group_message(
                  image: "assets/group.png",
                  name: "grp 2",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
