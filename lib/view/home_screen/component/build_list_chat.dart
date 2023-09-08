import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/chat_screen/chat_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildListChat(
    {required AsyncSnapshot snapShot,
    required ChatViewModele viewModel,
    required Size size}) {
  return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
            height: 5,
          ),
      itemCount: snapShot.data!.docs.length,
      itemBuilder: (context, index) {
        var data = snapShot.data!.docs[index];
        var currentUser = viewModel.firebaseAuth.currentUser;
        var time = data['lastMessageTime'] ?? Timestamp.now();
        DateTime datetime = time.toDate();
        viewModel.chatTime = DateFormat.Hm().format(datetime);
        if (currentUser != null && currentUser.email == data['email']) {
          viewModel.email = data['email'];
          viewModel.username = data['username'];
        }

        if (currentUser != null &&
            currentUser.email != data['email'] &&
            data['lastMessage'] != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  data['username'],
                  style: Styles.regulerTitleSecond,
                ),
                subtitle: Text(
                  data['lastMessage'] ?? 'Pesan masih kosong',
                  style: Styles.regulerSubtitle,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  viewModel.chatTime,
                  style: Styles.regulerSecond,
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Styles.secondryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.person,
                    color: Styles.whiteColor,
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(
                              name: data['username'],
                              id: data['docId'],
                            ))),
              ),
            ),
          );
        } else if (currentUser != null && currentUser.email != data['email']) {
          if (data['email'] == null) {
            return Center(
              child: Image.asset(
                'assets/icons/logo_no_data.jpg.png',
                width: size.width * 0.6,
              ),
            );
          }
        }
        return Container();
      });
}
