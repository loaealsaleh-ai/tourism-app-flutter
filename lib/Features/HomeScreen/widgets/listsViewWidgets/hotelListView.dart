import 'package:flutter/cupertino.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/HotelCard.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child:ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
        return HotelCard();
      })
    );
  }
}
