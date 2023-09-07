import 'package:chat_app/common/styles.dart';
import 'package:chat_app/firebase_service/constant_firebase_service.dart';
import 'package:chat_app/view/chat_screen/component/bottom_text_typer.dart';
import 'package:chat_app/view/chat_screen/component/build_chat.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String id;
  const ChatScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Styles.secondryColor,
            )),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Styles.secondryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.person,
                color: Styles.whiteColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.name,
              style: Styles.regulerTitleSecond,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: ConstantFirebaseService.getMessage(
                        userId: widget.id,
                        otherUserId: viewModel.firebaseAuth.currentUser!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Image.asset(
                            'assets/icons/logo_error.png',
                            width: size.width * 0.5,
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: LoadingAnimationWidget.dotsTriangle(
                              color: Styles.secondryColor, size: 50),
                        );
                      } else if (snapshot.data != null &&
                          snapshot.data!.docs.isNotEmpty) {
                        return buildChat(
                            snapshot: snapshot, viewModel: viewModel);
                      } else if (snapshot.data != null &&
                          snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/icons/logo_no_data.jpg.png',
                            width: size.width * 0.6,
                          ),
                        );
                      }
                      return Container();
                    })),
            bottomTextTyper(
                message: message,
                viewModel: viewModel,
                id: widget.id,
                docId: viewModel.docId,
                lastMessage: viewModel.lastMessage)
          ],
        ),
      ),
    );
  }
}
