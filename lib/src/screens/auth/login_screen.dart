import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/logic/bloc/auth_bloc.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
      body: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthInitial || state is AuthRegisterSuccess || state is AuthError) {
          return Form(
            key: _formKey,
            child: Column(
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
                PrimaryButton(
                    title: 'Войти',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      } else {
                        return;
                      }
                    }),
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
        } else if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      }, listener: (context, state) {
        if (state is AuthError) {
          final errorMessage = state.error;
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage)));
          });
        }else if(state is AuthLoginSuccess){
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Вы успешно вошли')));
          });
        }
      }),
    );
  }
}
