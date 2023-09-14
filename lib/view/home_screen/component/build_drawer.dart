import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/auth_screen/login_screen.dart';
import 'package:chat_app/view/profile_screen/profile_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';

Widget buildDrawer(
    {required BuildContext context, required ChatViewModele viewModel}) {
  return Drawer(
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
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()));
          },
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
  );
}
