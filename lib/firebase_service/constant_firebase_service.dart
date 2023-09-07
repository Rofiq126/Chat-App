import 'package:chat_app/model/message_model.dart';
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
        .then((value) {
      userModel.docId = value.user!.uid;
      userModel.createdAt = DateTime.now();
      firebaseFirestore.collection('users').doc(value.user!.uid).set(
        {
          'userId': userModel.docId,
          'lastMessage': userModel.lastMessage,
          'username': userModel.username,
          'createdAt': userModel.createdAt,
          'email': userModel.email,
          'password': userModel.password
        },
      );
    });
  }

  static Future login({required UserModel userModel}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  }

  static Future logout() async {
    await firebaseAuth.signOut();
  }

  static Future sendMessage(
      {required String receiverId, required String message}) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email!;
    final DateTime timestamp = DateTime.now();
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await firebaseFirestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.messageToJson());
  }

  static Stream<QuerySnapshot> getMessage(
      {required String userId, required String otherUserId}) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return firebaseFirestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  static Future updateLastMessage(
      {required String lastMessage, required String docId}) async {
    return await firebaseFirestore
        .collection('users')
        .doc(docId)
        .update({'lastMessage': lastMessage});
  }
}
