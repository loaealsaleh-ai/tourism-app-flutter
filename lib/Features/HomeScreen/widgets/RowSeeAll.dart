import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../SeeAllScreen/seeAllScreen.dart';
import '../../SeeAllScreen/seeAllType.dart';

class RowsSeeAll extends StatelessWidget {
  const RowsSeeAll({super.key, required this.title, required this.type});
  final String title;
  final SeeAllType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
           Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KPrimarColor
            ),
          ),
          const Spacer(),
           InkWell(
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (_) =>  SeeAllScreen(
                     type: type,
                   ),
                 ),
               );
             },
             child: Row(
                children: [
                  Text(
                    'See all',
                    style: TextStyle(
                        color: KPrimarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                ],
              ),
           )
        ],
      ),
    );
  }
}
