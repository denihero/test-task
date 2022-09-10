import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/auth/auth_bloc.dart';
import 'package:test_task/logic/profile_cubit/profile_cubit.dart';
import 'package:test_task/logic/string.dart';
import 'package:test_task/src/screens/auth/widget/primary_button.dart';
import 'package:test_task/src/screens/auth/widget/email_or_name_tff.dart';
import 'package:test_task/src/screens/auth/widget/line.dart';
import 'package:test_task/src/screens/auth/widget/passwod_tff.dart';
import 'package:test_task/src/screens/home_screen/widget/bounce_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  bool check(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) {
      return false;
    }
    return true;
  }

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
      backgroundColor: const Color.fromRGBO(243, 244, 245, 1),
      resizeToAvoidBottomInset: false,
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
        if (state is AuthInitial ||
            state is AuthRegisterSuccess ||
            state is AuthError) {
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
                        check(emailController.text)
                            ? context.read<AuthBloc>().add(LoginEmailEvent(
                                email: emailController.text.replaceAll(' ', ''),
                                password: passwordController.text))
                            : context.read<AuthBloc>().add(LoginNickNameEvent(
                                nickname: emailController.text.replaceAll(' ', ''),
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
          return const Center(child: SpinKitDoubleBounce(color: Colors.blue,));
        }
        return const Center(child: SpinKitDoubleBounce(color: Colors.blue,));
      }, listener: (context, state) {
        if (state is AuthError) {
          final errorMessage = state.error;
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage)));
          });
        } else if (state is AuthLoginSuccess) {
          BlocProvider.of<ProfileCubit>(context).getProfile(Api.token(context));
          Api.refresh(context);
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Вы успешно вошли')));
          });
        }
      }),
    );
  }
}
