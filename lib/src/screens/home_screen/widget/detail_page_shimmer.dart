import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerDetailScreen extends StatelessWidget {
  const ShimmerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 370,
                        height: 165,
                        color: Colors.white,
                      ),
                      Positioned.fill(
                          top: 20,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[200]!,
                                child: Container(
                                  height: 10,
                                  width: 100,
                                  color: Colors.white,
                                ),
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
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[200]!,
                      child: Container(
                       height: 10,
                       width: 100,
                       color: Colors.white,
                      ),
                    )
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
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[200]!,
                          child: Container(
                            width: 50,
                            height: 10,
                            color: Colors.white,
                          ),
                        ),
                  ),),
                  ListTile(
                    leading: const Icon(
                      Icons.place_outlined,
                      color: Colors.black,
                    ),
                    title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[200]!,
                          child: Container(
                            width: 50,
                            height: 10,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              )
      ),
    );
  }
}
