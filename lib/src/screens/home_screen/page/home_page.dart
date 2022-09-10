import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/restaurant_cubit/restaurant_cubit.dart';
import 'package:test_task/logic/string.dart';
import 'package:test_task/src/screens/home_screen/widget/shimmer_cart_loading.dart';

import '../widget/info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      body: RefreshIndicator(
        onRefresh: () async {
          Api.refresh(context);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 360,
              child: TextFormField(
                onChanged: (value) {
                  BlocProvider.of<RestaurantCubit>(context).searchRestaurant(Api.token(context), value);
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(224, 230, 237, 1)
                        )),
                    hintText: 'Поик',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<RestaurantCubit, RestaurantState>(
              builder: (context, state) {
                if(state is RestaurantSuccess){
                  final rest = state.restaurant;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: rest.restaurants?.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InfoCard(restaurant: rest.restaurants![index],),
                            );
                          }),
                    );
                }else if(state is RestaurantError){
                  return RefreshIndicator(onRefresh: () async {
                    BlocProvider.of<RestaurantCubit>(context).getRestaurant(Api.token(context));
                  },
                  child: const Center(child: Text('Something get wrong'),));
                }else if(state is RestaurantLoading){
                  return Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return const ShimmerCardLoading();
                        }),
                  );
                }else if(state is RestaurantSearchSuccess){
                  final searchResult = state.restaurant;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: searchResult.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InfoCard(restaurant: searchResult[index],),
                          );
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
