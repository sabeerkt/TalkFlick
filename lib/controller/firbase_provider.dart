import 'package:chat/model/group_model.dart';
import 'package:chat/model/message_model.dart';
import 'package:chat/model/user_model.dart';
import 'package:chat/service/auth/auth_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  List<UserModel> users = [];
  List<UserModel> searchedusers = [];
  List<Message> messages = [];
  AuthService service = AuthService();
  ScrollController scrollController = ScrollController();
  List<GroupModel> grouplist = [];

  List<GroupModel> fetchGroups() {
    try {
      service.firestore.collection("groups").snapshots().listen((group) {
        grouplist = group.docs
            .map((group) => GroupModel.fromJson(group.data()))
            .toList();
        notifyListeners();
      });
      return grouplist;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<UserModel> getAllUsers() {
    service.firestore.collection('user').snapshots().listen((user) {
      users = user.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      loadUsers();
      notifyListeners();
    });
    return users;
  }

  List<Message> getMessages(String currentuserid, String recieverid) {
    List ids = [currentuserid, recieverid];
    ids.sort();
    String chatroomid = ids.join("_");
    service.firestore
        .collection("chat_room")
        .doc(chatroomid)
        .collection("messages")
        .orderBy("time", descending: false)
        .snapshots()
        .listen((message) {
      messages =
          message.docs.map((doc) => Message.fromJson(doc.data())).toList();
      notifyListeners();
      scrollDown();
    });
    return messages;
  }

  Future<void> clearChat(String currentuserid, String recieverid) async {
    List ids = [currentuserid, recieverid];
    ids.sort();
    String chatroomid = ids.join("_");
    try {
      var snapshot = await service.firestore
          .collection("chat_room")
          .doc(chatroomid)
          .collection("messages")
          .get();

      var documents = snapshot.docs;
      for (DocumentSnapshot doc in documents) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  loadUsers() {
    searchedusers = users;
  }

  searchUser(String name) async {
    service.firestore
        .collection("user")
        .where("name", isGreaterThanOrEqualTo: name.toLowerCase())
        .snapshots()
        .listen((event) {
      searchedusers =
          event.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      notifyListeners();
    });
    return searchedusers;
  }

  void scrollDown() => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
}
