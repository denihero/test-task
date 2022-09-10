import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/addToFavourite_cubit/add_to_fav_cubit.dart';
import 'package:test_task/logic/restaurant_detail_cubit/restaurant_detail_cubit.dart';
import 'package:test_task/logic/string.dart';
import 'package:test_task/src/screens/home_screen/widget/bounce_loading.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RestaurantDetailCubit, RestaurantDetailState>(
          builder: (context, state) {
            if (state is RestaurantDetailSuccess) {
              final rest = state.detailRestaurant;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${rest.restaurant![0].images!.isEmpty
                                ? 'https://media.istockphoto.com/vectors/error-page-dead-emoji-illustration-vector-id1095047472?k=20&m=1095047472&s=612x612&w=0&h=1lDW_CWDLYwOUO7tAsLHnXTSwuvcWqWq4rysM1y6-E8='
                                : rest.restaurant?[0].images?[0].url
                            }',
                        placeholder: (context, url) =>
                            const SpinKitDoubleBounce(
                          color: Colors.blue,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 395,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: 400,
                        height: 10,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 90,
                              spreadRadius: 70,
                              offset: Offset(0, -25)),
                        ]),
                      ),
                      Positioned(
                          left: 10,
                          top: 5,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ))),
                      Positioned(
                          right: 10,
                          top: 5,
                          child: IconButton(
                              onPressed: () async {
                                if (rest.restaurant![0].isFavourite == true) {
                                  BlocProvider.of<AddToFavCubit>(context)
                                      .deleteFavourite(Api.token(context),
                                          rest.restaurant![0].id!);
                                } else {
                                  BlocProvider.of<AddToFavCubit>(context)
                                      .saveRestaurant(Api.token(context),
                                          rest.restaurant![0].id!);
                                }
                                BlocProvider.of<RestaurantDetailCubit>(context)
                                    .getRestaurantDetail(Api.token(context),
                                        rest.restaurant![0].id!);
                                Api.refresh(context);
                              },
                              icon: rest.restaurant![0].isFavourite!
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ))),
                      Positioned.fill(
                          top: 20,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '${rest.restaurant?[0].title}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Text(
                      'Описание',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(146, 146, 146, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 5),
                    child: Text(
                      '${rest.restaurant?[0].description}',
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontFamily: 'Manrope'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.access_time_outlined,
                      color: Colors.black,
                    ),
                    title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(
                          'Работаем c ${rest.restaurant?[0].schedule?.opening} до ${rest.restaurant?[0].schedule?.closing} ',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        )),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.place_outlined,
                      color: Colors.black,
                    ),
                    title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(
                            '${rest.restaurant?[0].coords?.addressName}',
                            style: const TextStyle(color: Colors.black))),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              );
            } else if (state is RestaurantDetailError) {
              return const Center(child: Text('Something get wrong'));
            } else if (state is RestaurantDetailLoading) {
              return const SpinKitDoubleBounce(
                color: Colors.blue,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
