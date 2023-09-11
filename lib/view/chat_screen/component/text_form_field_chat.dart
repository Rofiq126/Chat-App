import 'package:chat_app/common/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatFormFieldChat extends StatefulWidget {
  final String hintTExt;
  final TextEditingController controller;
  final FormFieldValidator validator;
  const ChatFormFieldChat({
    Key? key,
    required this.hintTExt,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<ChatFormFieldChat> createState() => _ChatFormFieldChatState();
}

class _ChatFormFieldChatState extends State<ChatFormFieldChat> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Styles.reguler,
      maxLines: null,
      validator: widget.validator,
      decoration: InputDecoration(
        hintStyle: Styles.regulerSecondry,
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hintTExt,
        filled: true,
        fillColor: Styles.whiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Colors.redAccent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Colors.redAccent)),
      ),
    );
  }
}
