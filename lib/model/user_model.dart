class UserModel {
  String? docId;
  String? username;
  String? lastMessage;
  DateTime? lastMessageTime;
  String email;
  DateTime? createdAt;
  String password;

  UserModel(
      {required this.email,
      required this.password,
      this.docId,
      this.lastMessageTime,
      this.username,
      this.createdAt,
      this.lastMessage});

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        docId = json['docId'],
        lastMessageTime = json['lastMessageTime'],
        createdAt = json['createdAt'],
        username = json['username'],
        lastMessage = json['lastMessage'],
        password = json['password'];

  userModelToJson() {
    return {
      'email': email,
      'docId': docId,
      'lastMessageTime': lastMessageTime,
      'createdAt': createdAt,
      'password': password,
      'username': username,
      'lastMessage': lastMessage
    };
  }
}
