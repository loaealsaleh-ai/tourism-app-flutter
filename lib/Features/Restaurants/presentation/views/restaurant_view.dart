import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Restaurants/data/repositories/restaurant_repository.dart';
import 'package:tourismapp/Features/Restaurants/data/services/restaurant_local_service.dart';
import 'package:tourismapp/Features/Restaurants/presentation/view_models/restaurant_details_view_model.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import '../../../../app/router/app_router.dart';
import '../widgets/restaurant_item_card.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantDetailsViewModel(
        RestaurantRepository(RestaurantLocalService()),
      )..loadRestaurants(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Royal Restaurant',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
              size: 25,
            ),
            onPressed: () {
              context.go(AppRouter.routMainScreen);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(child: SearchWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: RestaurantItemCard(
                      route: AppRouter.routRestaurantDetails,
                      isListView: true,
                    ),
                  );
                }, childCount: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}