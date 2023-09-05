import 'package:chat_app/common/custom_button.dart';
import 'package:chat_app/common/custom_textFormField.dart';
import 'package:chat_app/common/snack_bar.dart';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/auth_screen/login_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/logo_main.png',
                      width: size.width * 0.5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Registrasi',
                      style: Styles.titleMain,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Mari kita buat akun untukmu!',
                      style: Styles.title,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      hintTExt: 'Email',
                      controller: email,
                      obsecure: false,
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Styles.secondryColor,
                      ),
                      validator: (value) {
                        if (email.text.isEmpty) {
                          return 'Email tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      hintTExt: 'Kata Sandi',
                      controller: password,
                      obsecure: isVisiblePassword,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Styles.secondryColor,
                      ),
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisiblePassword = !isVisiblePassword;
                            });
                          },
                          icon: Icon(
                            isVisiblePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Styles.secondryColor,
                          )),
                      validator: (value) {
                        if (password.text.isEmpty) {
                          return 'Password tidak boleh kosong';
                        } else if (value != null &&
                            value != confirmPassword.text) {
                          return 'Password dan konfirmasi password harus sama!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      hintTExt: 'Konfirmasi Kata Sandi',
                      controller: confirmPassword,
                      obsecure: isVisibleConfirmPassword,
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisibleConfirmPassword =
                                  !isVisibleConfirmPassword;
                            });
                          },
                          icon: Icon(
                            isVisibleConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Styles.secondryColor,
                          )),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Styles.secondryColor,
                      ),
                      validator: (value) {
                        if (confirmPassword.text.isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        } else if (value != null && value != password.text) {
                          return 'Password dan konfirmasi password harus sama!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await viewModel
                                .createAccount(
                                    userModel: UserModel(
                                        email: email.text,
                                        password: password.text))
                                .then((value) {
                              if (viewModel.message == 'register success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackbarStyles.registerSuccess);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
                              } else if (viewModel.message ==
                                  'The password provided is too weak.') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackbarStyles.weakPassword);
                              } else if (viewModel.message ==
                                  'The account already exists for that email.') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackbarStyles.emailInUse);
                              } else if (viewModel.message == 'Email invalid') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackbarStyles.emailNotValid);
                              } else if (viewModel.message == 'Weak Password') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackbarStyles.weakPassword);
                              }
                            });
                          }
                        },
                        nameButton: 'Registrasi'),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya akun?',
                          style: Styles.regulerSecond,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()));
                            },
                            child: const Text(
                              'Masuk',
                              style: Styles.regulerActive,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
