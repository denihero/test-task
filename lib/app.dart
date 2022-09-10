import 'package:flutter/material.dart';
import 'package:test_task/logic/addToFavourite_cubit/add_to_fav_cubit.dart';
import 'package:test_task/logic/favourite_cubit/favourite_cubit.dart';
import 'package:test_task/logic/profile_cubit/profile_cubit.dart';
import 'package:test_task/src/screens/auth/login_screen.dart';
import 'package:test_task/src/screens/auth/sign_up_screen.dart';
import 'package:test_task/src/screens/home_screen/detail_screen.dart';
import 'package:test_task/src/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/auth/auth_bloc.dart';
import 'logic/restaurant_cubit/restaurant_cubit.dart';
import 'logic/restaurant_detail_cubit/restaurant_detail_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<RestaurantCubit>(create: (context) => RestaurantCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit()),
        BlocProvider<AddToFavCubit>(create: (context) => AddToFavCubit()),
        BlocProvider<RestaurantDetailCubit>(
            create: (context) => RestaurantDetailCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/sign_up': (context) => const SignUpScreen(),
          '/detail': (context) => DetailScreen()
        },
      ),
    );
  }
}
