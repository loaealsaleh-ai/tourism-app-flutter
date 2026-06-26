import 'package:flutter/material.dart';
import '../../const.dart';
import '../HomeScreen/widgets/HotelCard.dart';
import '../HomeScreen/widgets/TripPackageCard.dart';
import '../HomeScreen/widgets/listsViewWidgets/hotelListView.dart';
import '../HomeScreen/widgets/listsViewWidgets/restaurantListView.dart';
import '../HomeScreen/widgets/listsViewWidgets/tripeListView.dart';
import '../HomeScreen/widgets/restaurant_card.dart';
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

  Widget getItem() {
    switch (type) {
      case SeeAllType.trips:
        return const TripPackageCard();

      case SeeAllType.hotels:
        return const HotelCard();

      case SeeAllType.restaurants:
        return const RestaurantCard();
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: SearchWidget(),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: getItem(),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}