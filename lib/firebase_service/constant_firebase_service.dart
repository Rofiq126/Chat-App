import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConstantFirebaseService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static Future register({required UserModel userModel}) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password)
        .then((value) => firebaseFirestore.collection('Users').add({
              'userId': value.user!.uid,
              'createdAt': DateTime.now(),
              'email': userModel.email,
              'password': userModel.password
            }));
  }

  static Future login({required UserModel userModel}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  }

  static Future logout() async {
    await firebaseAuth.signOut();
  }
}
