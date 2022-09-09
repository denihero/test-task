import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 20,
      endIndent: 15,
      color: Color.fromRGBO(224,230,237, 0.8),
    );
  }
}
