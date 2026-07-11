import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/SeeAllScreen/presentation/view_models/see_all_type.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/widgets/cards/hotel_card.dart';
import 'package:tourismapp/core/widgets/cards/restaurant_card.dart';
import 'package:tourismapp/core/widgets/cards/trip_package_card.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';

import '../../../../app/router/app_router.dart';
import '../../../Restaurants/presentation/widgets/restaurant_item_card.dart';

class SeeAllView extends StatelessWidget {
  final SeeAllType type;

  const SeeAllView({
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
        return const RestaurantItemCard(route: AppRouter.routRestaurantDetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          getTitle(),
          style: const TextStyle(
            color: kPrimaryColor,
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