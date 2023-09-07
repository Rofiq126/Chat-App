class UserModel {
  String? docId;
  String? username;
  String? lastMessage;
  String email;
  DateTime? createdAt;
  String password;

  UserModel(
      {required this.email,
      required this.password,
      this.docId,
      this.username,
      this.createdAt,
      this.lastMessage});

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        docId = json['docId'],
        createdAt = json['createdAt'],
        username = json['username'],
        lastMessage = json['lastMessage'],
        password = json['password'];

  userModelToJson() {
    return {
      'email': email,
      'docId': docId,
      'createdAt': createdAt,
      'password': password,
      'username': username,
      'lastMessage': lastMessage
    };
  }
}
