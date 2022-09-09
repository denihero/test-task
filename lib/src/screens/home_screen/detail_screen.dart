import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://www.cnu.org/sites/default/files/styles/public_square_feature_image/public/beverly-center-lighting.jpg?itok=gHo9QySd',
                  width: 400,
                  height: 250,
                ),
                Container(
                  width: 400,
                  height: 10,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 90,
                      spreadRadius: 70,
                      offset: Offset(0, -25)
                    ),
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ))),
                const Positioned.fill(
                    top: 20,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Esentai Mall',
                          style: TextStyle(
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
              child: Text('Описание',style: TextStyle(fontSize: 15,fontFamily: 'Manrope',fontWeight: FontWeight.w400,color: Color.fromRGBO(	146, 146, 146,1)),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16,top: 5),
              child: Text(
                'Новый способ обжарки хачапури только у нас. И вкуснейшие салатики малибу и ...',
                style: TextStyle(
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
              leading: const Icon(Icons.access_time_outlined,color: Colors.black,),
              title: Transform.translate(
                offset: const Offset(-20, 0),
                  child: const Text('Работаем с 20:00 до 18:00 ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight:FontWeight.w400,fontFamily: 'Manrope'),)),
            ),
            ListTile(
              leading: const Icon(Icons.place_outlined,color: Colors.black,),
              title: Transform.translate(
                  offset: const Offset(-20, 0),
                  child: const Text('Аль-Фараби',style: TextStyle(color: Colors.black))),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
