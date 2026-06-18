import 'package:flutter/material.dart';
import '../../const.dart';
import '../HomeScreen/widgets/listsViewWidgets/hotelListView.dart';
import '../HomeScreen/widgets/listsViewWidgets/restaurantListView.dart';
import '../HomeScreen/widgets/listsViewWidgets/tripeListView.dart';
import '../HomeScreen/widgets/searchWidget.dart';
import 'seeAllType.dart';

class SeeAllScreen extends StatelessWidget {
  final SeeAllType type;

  const SeeAllScreen({
    super.key,
    required this.type,
  });

  String getTitle() {
    switch (type) {
      case SeeAllType.trips:
        return "Trips";

      case SeeAllType.hotels:
        return "Hotels";

      case SeeAllType.restaurants:
        return "Restaurants";
    }
  }

  Widget getContent() {
    switch (type) {
      case SeeAllType.trips:
        return const TripeListView(
          isSeeAll: true,
        );

      case SeeAllType.hotels:
        return const HotelListView(
          isSeeAll: true,
        );

      case SeeAllType.restaurants:
        return const RestaurantListView(
          isSeeAll: true,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F3F9),
        elevation: 0,
        centerTitle: true,
        title: Text(
          getTitle(),
          style: TextStyle(
            color: KPrimarColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchWidget(),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: getContent(),
          ),
        ],
      ),
    );
  }
}