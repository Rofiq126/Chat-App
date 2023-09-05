import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackbarStyles {
  static SnackBar succesLogin = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Login Berhasil',
            message: 'Kamu akan langsung diarahkan ke halaaman utama',
            contentType: ContentType.success),
      ));
  static SnackBar userNotFound = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Pengguna Tidak Ditemukan',
            message: 'Harap gunakan email yang sudah terdaftar',
            contentType: ContentType.warning),
      ));
  static SnackBar wrongPassword = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Password Salah',
            message: 'Harap gunakan kata sandi yang tepat',
            contentType: ContentType.warning),
      ));
  static SnackBar emailNotValid = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Email Tidak Valid',
            message: 'Harap gunakan email yang valid',
            contentType: ContentType.warning),
      ));
  static SnackBar registerSuccess = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Registrasi Berhasil',
            message: 'Silahkan login untuk dapat masuk ke aplikasi',
            contentType: ContentType.success),
      ));
  static SnackBar weakPassword = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Password Lemah',
            message: 'Gunakan password yang lebih kuat',
            contentType: ContentType.warning),
      ));
  static SnackBar emailInUse = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AwesomeSnackbarContent(
            title: 'Email Telah Digunakan',
            message: 'Harap gunakan email yang belum terdaftar',
            contentType: ContentType.warning),
      ));
}
