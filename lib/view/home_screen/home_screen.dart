import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/auth_screen/login_screen.dart';
import 'package:chat_app/view/contact_screen/contact_screen.dart';
import 'package:chat_app/view/home_screen/component/build_list_chat.dart';
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
      appBar: AppBar(
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
            return buildListChat(
                snapShot: snapShot, viewModel: viewModel, size: size);
          }),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ContactScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Styles.secondryColor,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Styles.whiteColor,
        child: Column(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Styles.secondryColor),
                child: ListTile(
                  leading: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Styles.whiteColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person,
                      color: Styles.secondryColor,
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.username,
                        style: Styles.regulerTitleWhite,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        viewModel.email,
                        style: Styles.regulerWhite,
                      )
                    ],
                  ),
                )),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.person,
                color: Styles.secondryColor,
              ),
              title: const Text(
                'Akun',
                style: Styles.regulerSecond,
              ),
            ),
            ListTile(
              onTap: () async {
                await viewModel.logout().then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen())));
              },
              leading: const Icon(
                Icons.logout_rounded,
                color: Styles.secondryColor,
              ),
              title: const Text(
                'Keluar aplikasi',
                style: Styles.regulerSecond,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
