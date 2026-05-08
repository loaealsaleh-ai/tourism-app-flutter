import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class RowsSeeAll extends StatelessWidget {
  const RowsSeeAll({super.key, required this.title});
  final String title;

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
           Row(
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
            )
        ],
      ),
    );
  }
}
