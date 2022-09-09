import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      appBar: AppBar(
        title: const Text('Профиль',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Icon(Icons.person,size: 150 ,),
          const Text('Марипбек Чингиз',style: TextStyle(fontSize: 24,fontFamily: 'Manrope',fontWeight: FontWeight.w600,fontStyle: FontStyle.normal),),
          const Text('maripbekoff@gmail.com',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,fontStyle:FontStyle.normal,color: Color.fromRGBO(146, 146, 146, 1)),),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: () {},
            title: const Text('Выйти',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400),),
          )

        ],
      )
    );
  }
}
