import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  child: Image.network(
                    'https://www.cnu.org/sites/default/files/styles/public_square_feature_image/public/beverly-center-lighting.jpg?itok=gHo9QySd',
                    width: 370,
                    height: 165,
                    fit: BoxFit.cover,
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 16,top: 11),
                child: Text(
                  'Esentail Mall',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16,top: 1),
                    child: SizedBox(
                      width: 290,
                      child: Text(
                        'Один из крупнейших торговых центров в ... Аль-Фараби',
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope',
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                 Transform.translate(
                   offset: const Offset(0,-20),
                     child: IconButton(
                         onPressed: () {},
                         icon: const Icon(Icons.favorite,size: 30,color: Colors.red,)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
