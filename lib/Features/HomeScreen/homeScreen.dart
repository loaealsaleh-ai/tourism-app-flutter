import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/RowSeeAll.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/homeHeaderWidget.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/hotelListView.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/restaurantListView.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/servicesListView.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/tripeListView.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderWidget(),
            RowsSeeAll(title: 'Trip Package'),
            TripeListView(),
            RowsSeeAll(title: 'Hotels'),
            HotelListView(),
            RowsSeeAll(title: 'Restaurants'),
            RestaurantListView(),
            RowsSeeAll(title: 'Services'),
            ServicesListView(),
            SizedBox(height: 50,)
          ],
        )
      );
  }
}
