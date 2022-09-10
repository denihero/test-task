import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/restaurant_cubit/restaurant_cubit.dart';

import 'bloc/auth_bloc.dart';
import 'favourite_cubit/favourite_cubit.dart';

class Api{
  static const String api = 'http://188.225.83.80:6719';

  static String token(BuildContext context){
    String token = BlocProvider.of<AuthBloc>(context).state.auth!.tokens!.accessToken!;
    return token;
  }

  static void refresh(BuildContext context){
    BlocProvider.of<RestaurantCubit>(context).getRestaurant(Api.token(context));
    BlocProvider.of<FavouriteCubit>(context).getFavourite(Api.token(context));
  }



}