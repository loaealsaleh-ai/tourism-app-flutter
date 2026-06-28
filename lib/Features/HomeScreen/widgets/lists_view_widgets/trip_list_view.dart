import 'package:flutter/material.dart';

import '../trip_package_card.dart';

class TripeListView extends StatelessWidget {
  const TripeListView({super.key, required this.isSeeAll});
  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSeeAll?null:210,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5),
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          scrollDirection:
          isSeeAll?Axis.vertical: Axis.horizontal,
          itemBuilder: (context,index){
        return Padding(
          padding:  EdgeInsets.only(
              bottom: isSeeAll?16:0
          ),
          child: TripPackageCard(),
        );
      })
    );
  }
}
