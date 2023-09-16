import 'dart:io';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Styles.secondryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipOval(
                    child: viewModel.pickedFile != null
                        ? Image.file(
                            File(viewModel.pickedFile!.path!),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/icons/empty_user_icon.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: InkWell(
                    onTap: () async {
                      const Center(
                        child: CircularProgressIndicator(
                            color: Styles.secondryColor),
                      );
                      await viewModel
                          .pickFiles()
                          .then((value) => viewModel.uploadImageProfile())
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ProfileScreen())));
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Styles.secondryColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Styles.whiteColor,
                          size: 20,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              viewModel.username,
              style: Styles.largeTitleWhite,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              viewModel.email,
              style: Styles.regulerTitleGrey,
            )
          ],
        ),
      ),
    );
  }
}
