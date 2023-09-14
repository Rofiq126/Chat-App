import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/contact_screen/contact_screen.dart';
import 'package:chat_app/view/home_screen/component/build_drawer.dart';
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
        drawer: buildDrawer(context: context, viewModel: viewModel));
  }
}
