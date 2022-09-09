import 'package:flutter/material.dart';
import 'package:test_task/src/screens/auth/login_screen.dart';
import 'package:test_task/src/screens/auth/sign_up_screen.dart';
import 'package:test_task/src/screens/home_screen/detail_screen.dart';
import 'package:test_task/src/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: '/home',
      routes: {
        '/':(context) => const LoginScreen(),
        '/home':(context) => const HomeScreen(),
        '/sign_up':(context) => const SignUpScreen(),
        '/detail':(context) => const DetailScreen()
      },
    );
  }
}
