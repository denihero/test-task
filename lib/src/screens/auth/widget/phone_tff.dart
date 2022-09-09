import 'package:flutter/material.dart';

class PhoneTFF extends StatelessWidget {
  const PhoneTFF({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(195, 195, 195, 1)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        hintText:'Телефон',
      ),
    );
  }
}
