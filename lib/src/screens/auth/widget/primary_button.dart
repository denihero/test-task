import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 64,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(70, 49, 210, 1)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))))),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
