import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/SeeAllScreen/presentation/view_models/see_all_type.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/widgets/cards/trip_package_card.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/restaurant_item_card.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/token_storage_service.dart';
import '../../../HomeScreen/presentation/widgets/lists_view_widgets/hotel_list_view.dart';
import '../../../Hotels/data/repositories/hotel_repository.dart';
import '../../../Hotels/data/services/hotel_service.dart';
import '../../../Hotels/presentation/view_models/hotelCubit/hotel_cubit.dart';


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
        return HotelListView(isSeeAll: true,);


      case SeeAllType.restaurants:
        return const RestaurantItemCard(
          route: AppRouter.routRestaurantDetails,
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HotelCubit(
          HotelRepository(
            HotelService(
              ApiService(Dio(), TokenStorageService(),),
            ),
          ),
        )..getHotels(),

      child: Scaffold(
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

            SliverToBoxAdapter(
              child: getItem(),
            ),


          ],
        ),
      ),
    );
  }
}