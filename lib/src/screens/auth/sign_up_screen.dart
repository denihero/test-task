import 'package:flutter/material.dart';
import 'package:test_task/src/screens/auth/widget/primary_button.dart';
import 'package:test_task/src/screens/auth/widget/email_or_name_tff.dart';
import 'package:test_task/src/screens/auth/widget/line.dart';
import 'package:test_task/src/screens/auth/widget/passwod_tff.dart';
import 'package:test_task/src/screens/auth/widget/phone_tff.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late TextEditingController loginController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  @override
  void initState() {
    loginController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: const Text('Регистрация',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
      ),

      body:Column(
        children:  [
          const SizedBox(height: 30,),
          EmailOrNameTFF(
            hintText: 'Логин',
            controller: loginController,
          ),
          const Line(),
          PhoneTFF(
            controller: phoneController,
          ),
          const Line(),
          EmailOrNameTFF(
            hintText: 'Почта',
            controller: emailController,
            isNameOrLogin: false,
          ),
          const Line(),
          PasswordTFF(controller: passwordController,),
          const Spacer(),
          PrimaryButton(title: 'Создать аккаунт', onPressed: () {}),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
