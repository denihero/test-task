import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/addToFavourite_cubit/add_to_fav_cubit.dart';
import 'package:test_task/logic/model/detail_restaurant.dart';
import 'package:test_task/logic/model/restaurant.dart';
import 'package:test_task/logic/restaurant_detail/restaurant_detail_cubit.dart';
import 'package:test_task/logic/string.dart';

import 'bounce_loading.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.restaurant,})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<RestaurantDetailCubit>(context).getRestaurantDetail(Api.token(context), restaurant.id!);
          Navigator.pushNamed(context, '/detail',
              arguments: {'restaurant': restaurant,});
        },
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  child: CachedNetworkImage(
                    imageUrl: 'https://static.timesofisrael.com/www/uploads/2019/04/-%D7%A1%D7%94%D7%A8-%D7%A4%D7%A8%D7%A1%D7%95%D7%9D-%D7%95%D7%94%D7%A4%D7%A7%D7%95%D7%AA-e1554720242329.jpg',
                    placeholder: (context, url) =>  const SpinKitDoubleBounce(color: Colors.blue,) ,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: 370,
                    height: 165,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 11),
                child: Text(
                  '${restaurant.title}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 1),
                    child: SizedBox(
                      width: 290,
                      child: Text(
                        '${restaurant.description}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope',
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(0, -20),
                      child: IconButton(
                          onPressed: () {
                            if(restaurant.isFavourite == true){
                              BlocProvider.of<AddToFavCubit>(context).deleteFavourite(Api.token(context), restaurant.id!);
                            }else{
                              BlocProvider.of<AddToFavCubit>(context).saveRestaurant(Api.token(context), restaurant.id!);
                            }
                            Api.refresh(context);
                          },
                          icon: restaurant.isFavourite!
                              ? const Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  size: 30,
                                )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
