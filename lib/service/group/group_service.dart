import 'package:chat/model/group_model.dart';
import 'package:chat/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //refernce for collection
  //if the collection already exists then it will automatically go to the collection or create a new collection

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  //updating user data

  Future SavingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  //getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //get user group

  getUserGroup() async {
    return userCollection.doc(uid).snapshots();
  }
Future createGroup(String id, String userName, String groupName) async {
  final GroupModel group = GroupModel(
      admin: id,
      groupIcon: "",
      groupId: "",
      groupName: groupName,
      members: [],
      recentMessage: "",
      recentMessageSender: "");
  DocumentReference groupDocumentReference =
      await groupCollection.add(group.toJson());
  await groupDocumentReference.update({
    "members": FieldValue.arrayUnion([id]),
    "groupId": groupDocumentReference.id,
  });

  DocumentReference userDocumentReference = userCollection.doc(id);
  return await userDocumentReference.update({
    "groups": FieldValue.arrayUnion([groupDocumentReference.id]),
  });
}


  Future<void> sendMessagess({
    required String groupId,
    required Map<String, dynamic> chatMessageData,
  }) async {
    try {
      // Update the message
      await groupCollection
          .doc(groupId)
          .collection("messages")
          .add(chatMessageData);

      // Update recent message details for the group
      await groupCollection.doc(groupId).update({
        "recentMessage": chatMessageData['message'],
        "recentMessageSender": chatMessageData['sender'],
        "recentMessageTime": chatMessageData['time'].toString(),
      });
    } catch (e) {
      // Handle errors, such as document not found
      print("Error updating message: $e");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChats(String groupId) {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot["admin"];
  }

  //get group members
  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  //search
  searchByName(String groupName) {
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  //return a bool value
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot["groups"];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  //toggling group join or exit
  Future<void> addUserToGroup(
      {required String groupId, required UserModel user}) async {
    try {
      // Update the group document to add the user to the 'members' array
      await FirebaseFirestore.instance
          .collection("groups")
          .doc(groupId)
          .update({
        "members": FieldValue.arrayUnion([user.uid]),
      });

      // Update the user document to add the group to their 'groups' array
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        "groups": FieldValue.arrayUnion([groupId]),
      });
    } catch (e) {
      print("Error adding user to group: $e");
      throw Exception("Failed to add user to group");
    }
  }

  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    //doc ref
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    //if group has our group remove them or join them

    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${uid}_$userName"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}_$userName"])
      });
    }
  }
}
