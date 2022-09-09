import 'package:flutter/material.dart';
import 'package:test_task/src/screens/auth/widget/primary_button.dart';
import 'package:test_task/src/screens/auth/widget/email_or_name_tff.dart';
import 'package:test_task/src/screens/auth/widget/line.dart';
import 'package:test_task/src/screens/auth/widget/passwod_tff.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Авторизация',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailOrNameTFF(
            hintText: 'Логин или пароль',
            controller: emailController,
          ),
          const Line(),
          PasswordTFF(
            controller: passwordController,
            showHideIcon: false,
          ),
          const SizedBox(
            height: 32,
          ),
          PrimaryButton(title: 'Войти', onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
          PrimaryButton(
            title: 'Зарегистрироваться',
            onPressed: () {
              Navigator.pushNamed(context, '/sign_up');
            },
          ),
        ],
      ),
    );
  }
}
