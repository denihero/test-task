import 'package:flutter/material.dart';
import 'package:test_task/logic/model/restaurant.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.restaurant, required this.index})
      : super(key: key);

  final RestaurantCard restaurant;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail',
              arguments: {'restaurant': restaurant, 'index': index});
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
                  child: Image.network(
                    '${restaurant.restaurants?[index].images![0]}',
                    width: 370,
                    height: 165,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 11),
                child: Text(
                  '${restaurant.restaurants?[index].title}',
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
                        '${restaurant.restaurants?[index].description}',
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.red,
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
