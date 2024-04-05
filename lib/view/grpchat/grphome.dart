import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/service/group/group_service.dart';
import 'package:chat/view/grpchat/helper/helper.dart';
import 'package:chat/view/grpchat/widgets/group_tile.dart';
import 'package:chat/view/grpchat/widgets/serach_grp.dart';
import 'package:chat/view/grpchat/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupHome extends StatefulWidget {
  const GroupHome({Key? key}) : super(key: key);

  @override
  State<GroupHome> createState() => _HomePageState();
}

class _HomePageState extends State<GroupHome> {
  String userName = "hi";
  String email = "";
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameSF().then((value) {
      setState(() {
        userName = value!;
      });
    });
    //getting list of snapshot in stream
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroup()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(context, SearchPage());
              },
              icon: Icon(Icons.search))
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          "Community",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: groupList(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          popUpDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return AlertDialog(
              title: Text(
                "Create a group",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      //name field
                      : TextField(
                          onChanged: (val) {
                            setState(() {
                              groupName = val;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      // setState(() {
                      //   _isLoading = true;
                      // });
                      // DatabaseService(
                      //         uid: FirebaseAuth.instance.currentUser!.uid)
                      //     .createGroup(userName,
                      //         FirebaseAuth.instance.currentUser!.uid, groupName)
                      //     .whenComplete(() {
                      //   _isLoading = false;
                      // });
                      // Navigator.of(context).pop();
                      // showSnackBar(context, Colors.green, "Group created");
                    }
                  },
                  child: Text(
                    "Create",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['groups'].length != null) {
            if (snapshot.data['groups'].length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data["groups"].length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        snapshot.data['groups'].length - index - 1;
                    return GroupTile(
                        groupId: getId(snapshot.data['groups'][reverseIndex]),
                        groupName:
                            getName(snapshot.data["groups"][reverseIndex]),
                        userName: snapshot.data["fullName"]);
                  });
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              popUpDialog(context);
            },
            child: Icon(
              Icons.add_circle,
              color: Colors.grey,
              size: 75,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You have not joined any group tap on add or search icon to create or join a group",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
