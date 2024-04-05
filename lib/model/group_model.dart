class GroupModel {
  String? admin;
  String? groupIcon;
  String? groupId;
  String? groupName;
  List? members;
  String? recentMessage;
  String? recentMessageSender;

  GroupModel(
      {required this.admin,
      required this.groupIcon,
      required this.groupId,
      required this.groupName,
      required this.members,
      required this.recentMessage,
      required this.recentMessageSender});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    List members = [];
    if (json["members"] != null) {
      json["members"].forEach((v) {
        members.add(v);
      });
    }
    return GroupModel(
        admin: json["admin"],
        groupIcon: json["groupIcon"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        members: members,
        recentMessage: json["recentMessage"],
        recentMessageSender: json["recentMessageSender"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      "groupIcon": groupIcon,
      "groupId": groupId,
      "groupName": groupName,
      "members": members,
      "recentMessage": recentMessage,
      "recentMessageSender": recentMessageSender
    };
  }
}
