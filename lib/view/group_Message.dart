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
          const SizedBox(
            height: 40,
          ),
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
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 245,
                          245), // Changed the background color to black
                      borderRadius: BorderRadius.circular(
                          10), // Added border radius for rounded corners
                    ),
                    child: ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(0, 230, 224,
                              224), // Set the background color of the CircleAvatar to transparent
                          // backgroundImage: AssetImage('assets/add-friend.png'),
                          child: Icon(Icons.person_add),
                        ),
                        title: const Text(
                          'Create Groups',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 3, 3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Show dialog when tapped
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Create Group',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors
                                            .grey[200], // Light Grey Background
                                        backgroundImage:
                                            const AssetImage('assets/add-friend.png'),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        controller: _groupNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Group Name',
                                          labelStyle: const TextStyle(
                                            color: Colors.black87,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: _descriptionController,
                                        decoration: InputDecoration(
                                          labelText: 'Description',
                                          labelStyle: const TextStyle(
                                            color: Colors.black87,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle Save action
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              elevation: 2,
                                            ),
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Group_message(
                  image: "assets/teamwork.png",
                  name: "Group  1",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Group_message(
                  image: "assets/group.png",
                  name: "Groups 2",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
