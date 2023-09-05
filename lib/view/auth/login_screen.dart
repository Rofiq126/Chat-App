import 'package:chat_app/common/custom_button.dart';
import 'package:chat_app/common/custom_textFormField.dart';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view/auth/register_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/logo_main_second.png',
                    width: size.width * 0.6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'MyChat',
                    style: Styles.titleMain,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Selamat datang kembali, silahkan masuk!',
                    style: Styles.title,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      hintTExt: 'Email',
                      controller: email,
                      validator: (value) {
                        return null;
                      },
                      obsecure: false,
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Styles.secondryColor,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintTExt: 'Password',
                    controller: password,
                    validator: (value) {
                      return null;
                    },
                    obsecure: isVisible,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Styles.secondryColor,
                    ),
                    suffix: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Styles.secondryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {}
                      },
                      nameButton: 'Masuk'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum punya akun ?',
                        style: Styles.regulerSecond,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
                          },
                          child: const Text(
                            'Registrasi',
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
    );
  }
}
