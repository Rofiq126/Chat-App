import 'dart:io';

import 'package:chat_app/firebase_service/constant_firebase_service.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';

class ChatViewModele extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String message = '';
  String lastMessage = '';
  String docId = '';
  String chatTime = '';
  String username = '';
  String email = '';
  int contactSum = 0;
  PlatformFile? pickedFile;
  String? file;

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

  Future sendMessage(
      {required String receiverId, required String message}) async {
    try {
      await ConstantFirebaseService.sendMessage(
          receiverId: receiverId, message: message);
      message = 'Message sended';
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
    notifyListeners();
  }

  Future updateLastMessage(
      {required String lastMessage, required String docId}) async {
    try {
      if (docId.isNotEmpty) {
        ConstantFirebaseService.updateLastMessage(
            lastMessage: lastMessage, docId: docId);
      }
      debugPrint(lastMessage);
      debugPrint(docId);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
    notifyListeners();
  }

  Future pickFiles() async {
    var result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    pickedFile = result.files.first;
    notifyListeners();
  }

  Future uploadImageProfile() async {
    try {
      if (pickedFile != null) {
        final path = 'files/ ${pickedFile!.name}';
        final file = File(pickedFile!.path!);
        ConstantFirebaseService.uploadImageProfile(path: path, file: file);
        message = 'Upload succesfull';
      } else {
        message = 'Upload failed';
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
    notifyListeners();
  }
}
