import 'package:flutter/material.dart';

class Styles {
  static const Color primaryColor = Color(0xFF4345E8);
  static const Color secondryColor = Color(0xFF91B3FA);
  static const Color darkBlueColor = Color(0xFF150A80);
  static const Color whiteColor = Color(0xFFE3EAFD);

  static const TextStyle title = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.secondryColor);
  static const TextStyle button = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      color: whiteColor,
      fontWeight: FontWeight.w500);
  static const TextStyle titleMain = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Styles.primaryColor);
  static const TextStyle reguler = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.darkBlueColor);
  static const TextStyle regulerSecond = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.secondryColor);
  static const TextStyle regulerActive =
      TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.blueAccent);
}
