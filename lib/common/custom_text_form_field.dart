import 'package:chat_app/common/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintTExt;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final bool obsecure;
  final Widget? suffix;
  const CustomTextFormField(
      {Key? key,
      required this.hintTExt,
      required this.controller,
      required this.validator,
      required this.obsecure,
      this.prefixIcon,
      this.suffix})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Styles.reguler,
      obscureText: widget.obsecure,
      validator: widget.validator,
      decoration: InputDecoration(
        hintStyle: Styles.regulerSecondry,
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hintTExt,
        prefixIcon: widget.prefixIcon,
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
        suffixIcon: widget.suffix,
      ),
    );
  }
}
