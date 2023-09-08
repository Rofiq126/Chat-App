import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/chat_screen/chat_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Styles.secondryColor,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Contact',
              style: Styles.regulerTitleSecond,
            ),
            Text(
              '${viewModel.contactSum.toString()} contacts',
              style: Styles.regulerSecondry,
            )
          ],
        ),
        backgroundColor: Styles.whiteColor,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Image.asset(
                  'assets/icons/logo_error.png',
                  width: size.width * 0.5,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Styles.secondryColor, size: 50),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    viewModel.contactSum = snapshot.data!.docs.length;
                    var currentUser = viewModel.firebaseAuth.currentUser;
                    if (currentUser != null &&
                        currentUser.email != data['email']) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                      name: data['username'],
                                      id: data['docId'])));
                        },
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
                        title: Text(
                          data['username'],
                          style: Styles.regulerTitleSecond,
                        ),
                      );
                    }
                    return Container();
                  });
            }
          }),
    );
  }
}
