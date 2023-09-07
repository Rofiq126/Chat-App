import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/auth_screen/login_screen.dart';
import 'package:chat_app/view/chat_screen/chat_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Styles.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () async {
                await viewModel.logout().then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen())));
              },
              icon: const Icon(
                Icons.logout,
                color: Styles.secondryColor,
              )),
          title: const Text(
            'MyChat',
            style: Styles.title,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Center(
                  child: Image.asset(
                    'assets/icons/logo_error.png',
                    width: size.width * 0.5,
                  ),
                );
              }
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: Styles.secondryColor, size: 50),
                );
              }
              return ListView.builder(
                  itemCount: snapShot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapShot.data!.docs[index];
                    var currentUser = viewModel.firebaseAuth.currentUser;
                    if (currentUser != null &&
                        currentUser.email != data['email']) {
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
                              data['lastMessage'] ?? '',
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
                                          id: data['userId'],
                                        ))),
                          ),
                        ),
                      );
                    }
                    return Container();
                  });
            }));
  }
}
