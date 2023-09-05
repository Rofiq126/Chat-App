import 'package:chat_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ChatViewModele extends ChangeNotifier {
  var firebase = FirebaseAuth.instance;
  String message = '';

  Future createAccount({required UserModel userModel}) async {
    try {
      await firebase.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      message = 'register success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'email-invalid') {
        message = 'Email invalid';
      } else if (e.code == 'weak-password') {
        message = 'Weak Password';
      }
      notifyListeners();
    }
  }
}
