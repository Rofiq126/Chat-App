import 'package:chat_app/common/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  VoidCallback onPressed;
  String nameButton;
  CustomButton({Key? key, required this.onPressed, required this.nameButton})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Styles.secondryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            widget.nameButton,
            style: Styles.button,
          ),
        ));
  }
}
