import 'package:flutter/material.dart';
import 'package:test_task/src/screens/home_screen/widget/info_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      appBar: AppBar(
        title: const Text('Избранное',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index){
            return const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InfoCard(),
            );
          },
      ),
    );
  }
}
