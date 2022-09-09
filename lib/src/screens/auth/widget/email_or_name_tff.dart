import 'package:flutter/material.dart';

class EmailOrNameTFF extends StatelessWidget {
  const EmailOrNameTFF({Key? key, required this.hintText, required this.controller, this.isNameOrLogin= true}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isNameOrLogin;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNameOrLogin ? TextInputType.name:TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Colors.white,
        hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(195, 195, 195, 1)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        hintText:hintText,
      ),
    );
  }
}
