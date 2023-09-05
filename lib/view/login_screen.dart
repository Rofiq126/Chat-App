import 'package:chat_app/common/custom_button.dart';
import 'package:chat_app/common/custom_textFormField.dart';
import 'package:chat_app/common/styles.dart';
import 'package:chat_app/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ChatViewModele>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/logo_main.png',
                  width: size.width * 0.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'MyChat',
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
                  if (value == null) {
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
                obsecure: false,
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
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Styles.secondryColor,
                    )),
                validator: (value) {
                  if (value == null) {
                    return 'Password tidak boleh kosong';
                  } else if (value != null && password != confirmPassword) {
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
                obsecure: false,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisibleConfirmPassword = !isVisibleConfirmPassword;
                      });
                    },
                    icon: Icon(
                      isVisibleConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Styles.secondryColor,
                    )),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Styles.secondryColor,
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Konfirmasi password tidak boleh kosong';
                  } else if (value != null && password != confirmPassword) {
                    return 'Password dan konfirmasi password harus sama!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(onPressed: () {}, nameButton: 'Masuk'),
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
                      onPressed: () {},
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
    );
  }
}
