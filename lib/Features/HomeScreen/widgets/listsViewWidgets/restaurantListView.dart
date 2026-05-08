import 'package:flutter/cupertino.dart';

import '../restaurant_card.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
        return RestaurantCard();
      })
    );
  }
}
