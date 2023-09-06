import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/auth_screen/login_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () async {
              await viewModel.logout().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen())));
            },
            icon: const Icon(
              Icons.logout,
              color: Styles.primaryColor,
            )),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
