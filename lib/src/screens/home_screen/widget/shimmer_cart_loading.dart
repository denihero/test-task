import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardLoading extends StatelessWidget {
  const ShimmerCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    width: 370,
                    height: 165,
                    color: Colors.white,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 16, top: 11),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.white,
                  ),
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      height: 15,
                      width: 290,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
