import 'package:flutter/material.dart';


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
            const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: SizedBox(
                  width: 370,
                  height: 165,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 11),
              child: SizedBox()
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 1),
                  child: SizedBox(
                    width: 290,),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
