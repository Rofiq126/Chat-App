import 'package:chat_app/common/custom_text_form_field.dart';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';

Widget bottomTextTyper(
    {required TextEditingController message,
    required ChatViewModele viewModel,
    required String lastMessage,
    required String docId,
    required String id}) {
  return Row(
    children: [
      Flexible(
        child: CustomTextFormField(
          hintTExt: 'Tulis pesanmu disini',
          controller: message,
          validator: (value) {
            return null;
          },
          obsecure: false,
        ),
      ),
      IconButton(
          onPressed: () async {
            if (message.text.isNotEmpty) {
              await viewModel
                  .sendMessage(receiverId: id, message: message.text)
                  .then((value) => viewModel.updateLastMessage(
                      lastMessage: viewModel.lastMessage, docId: id));
              message.clear();
            }
          },
          icon: const Icon(
            Icons.send_rounded,
            color: Styles.secondryColor,
          ))
    ],
  );
}
