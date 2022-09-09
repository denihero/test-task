import 'package:flutter/material.dart';

import '../widget/info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: 360,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(224, 230, 237, 1)
                      )),
                  hintText: 'Поик',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index){
                  return const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: InfoCard(),
                  );
                }),
          ),
        ],
      ),

    );
  }
}
