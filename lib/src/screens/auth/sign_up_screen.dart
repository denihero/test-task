import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/auth/auth_bloc.dart';
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

  bool check(String email,) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if(!emailValid){
      return false;
    }
    return true;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 245, 1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          'Регистрация',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial || state is AuthRegisterSuccess || state is AuthError) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                  PasswordTFF(
                    controller: passwordController,
                  ),
                  const Spacer(),
                  PrimaryButton(
                      title: 'Создать аккаунт',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          check(emailController.text) ? context.read<AuthBloc>().add(RegisterEvent(
                              email: emailController.text,
                              nickname: loginController.text,
                              phoneNumber: phoneController.text,
                              password: passwordController.text)):ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Email contain invalid data"),
                            ),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          } else if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
        listener: (context, state) {
          if (state is AuthError) {
            final errorMessage = state.error;
            SchedulerBinding.instance.addPostFrameCallback((_) async {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(errorMessage)));
            });
          }else if(state is AuthRegisterSuccess){
            SchedulerBinding.instance.addPostFrameCallback((_) async {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Вы успешно зарегестрировались')));
              Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false);
            });
          }
        },
      ),
    );
  }
}
