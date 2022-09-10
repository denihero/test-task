import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/logic/favourite_cubit/favourite_cubit.dart';
import 'package:test_task/logic/string.dart';
import 'package:test_task/src/screens/home_screen/widget/info_card.dart';
import 'package:test_task/src/screens/home_screen/widget/shimmer_cart_loading.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      appBar: AppBar(
        title: Text(
          'Избранное',
          style: GoogleFonts.manrope(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FavouriteCubit>(context)
              .getFavourite(Api.token(context));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FavouriteCubit, FavouriteState>(
              builder: (context, state) {
                if (state is FavouriteSuccess) {
                  final restaurant = state.restaurant;
                  if (restaurant.restaurants!.isEmpty) {
                    return const Center(
                        child: Text('You don\'t have favourite '));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: restaurant.restaurants?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InfoCard(
                              restaurant: restaurant.restaurants![index],
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else if (state is FavouriteError) {
                  return const Center(
                    child: Text('Something get wrong'),
                  );
                } else if (state is FavouriteLoading) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return const ShimmerCardLoading();
                        }),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
