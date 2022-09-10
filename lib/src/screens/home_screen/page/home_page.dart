import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/restaurant_cubit/restaurant_cubit.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: 360,
            child: TextFormField(
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
                        itemCount: rest.count,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InfoCard(restaurant: rest.restaurants![index],),
                          );
                        }),
                  );
              }else if(state is RestaurantError){
                return const Center(child: Text('Somethig get wrong'),);
              }else if(state is RestaurantLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              return const SizedBox();

            },
          ),
        ],
      ),

    );
  }
}
