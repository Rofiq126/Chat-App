import 'package:chat_app/common/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String hintTExt;
  Icon prefixIcon;
  TextEditingController controller;
  FormFieldValidator validator;
  bool obsecure;
  Widget? suffix;
  CustomTextFormField(
      {Key? key,
      required this.hintTExt,
      required this.controller,
      required this.validator,
      required this.obsecure,
      required this.prefixIcon,
      this.suffix})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: widget.controller,
        style: Styles.reguler,
        obscureText: widget.obsecure,
        validator: widget.validator,
        decoration: InputDecoration(
          hintStyle: Styles.reguler,
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintTExt,
          prefixIcon: widget.prefixIcon,
          filled: true,
          fillColor: Styles.whiteColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
          suffixIcon: widget.suffix,
        ),
      ),
    );
  }
}
