import 'package:flutter/material.dart';

class PasswordTFF extends StatefulWidget {
  const PasswordTFF({Key? key, this.showHideIcon = true, required this.controller}) : super(key: key);
  final bool showHideIcon;
  final TextEditingController controller;

  @override
  State<PasswordTFF> createState() => _PasswordTFFState();
}

class _PasswordTFFState extends State<PasswordTFF> {
  final ValueNotifier<bool> isShowed = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isShowed,
      builder: (BuildContext context, bool newIsShowed, _) {
        return TextFormField(
          controller: widget.controller,
            obscureText: newIsShowed,
            validator: (value) {
              if(value == null || value.isEmpty || value.length < 7){
                return 'Пожалуйста заполните поле ';
              }else if(value.length <= 7){
                return 'Пароль должен состоять больше 8 символов';
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: Colors.white,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(195, 195, 195, 1)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                hintText: 'Пароль',
                suffixIcon: widget.showHideIcon
                    ? IconButton(
                        onPressed: () {
                          isShowed.value = !isShowed.value;
                        },
                        icon: newIsShowed
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))
                    : const SizedBox()));
      },
    );
  }
}
