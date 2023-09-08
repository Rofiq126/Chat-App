import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildChat(
    {required AsyncSnapshot snapshot, required ChatViewModele viewModel}) {
  return ListView.separated(
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 5,
      );
    },
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (context, index) {
      var data = snapshot.data!.docs[index];
      viewModel.lastMessage = data['message'];

      bool isSender =
          data['senderId'] == viewModel.firebaseAuth.currentUser!.uid
              ? true
              : false;
      return BubbleSpecialThree(
        text: data['message'],
        isSender: isSender,
        color: isSender ? Styles.secondryColor : Styles.whiteColor,
        tail: true,
        textStyle: isSender ? Styles.regulerWhite : Styles.regulerSecondry,
      );
    },
  );
}
