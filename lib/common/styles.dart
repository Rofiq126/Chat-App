import 'package:flutter/material.dart';

class Styles {
  static const Color primaryColor = Color(0xFF4345E8);
  static const Color secondryColor = Color(0xFF91B3FA);
  static const Color darkBlueColor = Color(0xFF150A80);
  static const Color whiteColor = Color(0xFFE3EAFD);

  static const TextStyle titleSecond = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.secondryColor);
  static const TextStyle title = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: Styles.secondryColor,
      fontWeight: FontWeight.w600);
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
  static const TextStyle regulerWhite =
      TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Styles.whiteColor);
  static const TextStyle regulerSecondry = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.secondryColor);
  static const TextStyle regulerTitle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Styles.darkBlueColor,
      fontWeight: FontWeight.w500);
  static const TextStyle regulerTitleSecond = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Styles.secondryColor,
      fontWeight: FontWeight.w500);
  static const TextStyle regulerTitleWhite = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Styles.whiteColor,
      fontWeight: FontWeight.w500);
  static const TextStyle regulerSubtitle =
      TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.black38);
  static const TextStyle regulerSecond = TextStyle(
      fontFamily: 'Poppins', fontSize: 12, color: Styles.secondryColor);
  static const TextStyle regulerActive =
      TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.blueAccent);
}
