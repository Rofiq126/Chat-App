import 'package:chat_app/common/custom_button.dart';
import 'package:chat_app/common/custom_text_form_field.dart';
import 'package:chat_app/common/snack_bar.dart';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/auth_screen/register_screen.dart';
import 'package:chat_app/view/home_screen/home_screen.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    style: Styles.titleSecond,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      hintTExt: 'Email',
                      controller: email,
                      validator: (value) {
                        if (email.text.isEmpty) {
                          return 'Email tidak dapat kosong!';
                        }
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
                        if (password.text.isEmpty) {
                          return 'Password tidak dapat kosong!';
                        }
                        return null;
                      },
                      obsecure: isVisible,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Styles.secondryColor,
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Styles.secondryColor,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await viewModel
                              .login(
                                  userModel: UserModel(
                                      email: email.text,
                                      password: password.text))
                              .then((value) {
                            if (viewModel.message == 'Login succesfull') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackbarStyles.succesLogin);
                              Future.delayed(
                                  const Duration(seconds: 4),
                                  () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomeScreen())));
                            } else if (viewModel.message ==
                                'No user found for that email.') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackbarStyles.userNotFound);
                            } else if (viewModel.message ==
                                'Wrong password provided for that user.') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackbarStyles.wrongPassword);
                            } else if (viewModel.message == 'Email not valid') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackbarStyles.emailNotValid);
                            }
                          });
                        }
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
                                    builder: (_) => const RegisterScreen()));
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
