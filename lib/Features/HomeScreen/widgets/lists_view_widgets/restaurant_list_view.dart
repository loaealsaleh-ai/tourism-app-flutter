import 'package:flutter/material.dart';

import '../restaurant_card.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key, required this.isSeeAll});
  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:isSeeAll? null: 270,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10,right: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection:
          isSeeAll?Axis.vertical: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
        return Padding(
          padding:  EdgeInsets.only(
            bottom: isSeeAll?16:0
          ),
          child: RestaurantCard(),
        );
      })
    );
  }
}
