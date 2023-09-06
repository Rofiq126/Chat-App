import 'package:chat_app/firebase_service/constant_firebase_service.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ChatViewModele extends ChangeNotifier {
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseFirestore = FirebaseFirestore.instance;
  String message = '';

  Future createAccount({required UserModel userModel}) async {
    try {
      await ConstantFirebaseService.register(userModel: userModel);
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
      } else {
        debugPrint(e.code);
      }
    }
    notifyListeners();
  }

  Future login({required UserModel userModel}) async {
    try {
      await ConstantFirebaseService.login(userModel: userModel);
      message = 'Login succesfull';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        message = 'Email not valid';
      } else {
        debugPrint(e.code);
      }
    }
    notifyListeners();
  }

  Future logout() async {
    try {
      await ConstantFirebaseService.logout();
      message = 'Signout succesfull';
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
    notifyListeners();
  }
}
