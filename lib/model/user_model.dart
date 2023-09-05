class UserModel {
  String email;
  String password;

  UserModel({required this.email, required this.password});

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  userModelToJson() {
    return {'email': email, 'password': password};
  }
}
