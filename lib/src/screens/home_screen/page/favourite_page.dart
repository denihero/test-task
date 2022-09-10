import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/favourite_cubit/favourite_cubit.dart';
import 'package:test_task/logic/restaurant_cubit/restaurant_cubit.dart';
import 'package:test_task/src/screens/home_screen/widget/info_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      appBar: AppBar(
        title: const Text('Избранное', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if(state is FavouriteSuccess){
            final restaurant = state.restaurant;
            return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InfoCard(
                    restaurant: restaurant[index],
                    index: index,
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
