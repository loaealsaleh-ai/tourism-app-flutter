import 'package:flutter/cupertino.dart';

import '../TripPackageCard.dart';

class TripeListView extends StatelessWidget {
  const TripeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return TripPackageCard();
      })
    );
  }
}
