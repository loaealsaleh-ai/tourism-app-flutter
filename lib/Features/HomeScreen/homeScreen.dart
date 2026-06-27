import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/data/repositories/home_repository.dart';
import 'package:tourismapp/Features/HomeScreen/data/services/home_local_service.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/view_models/home_view_model.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/RowSeeAll.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/homeHeaderWidget.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/hotelListView.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/restaurantListView.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/listsViewWidgets/tripeListView.dart';
import 'package:tourismapp/Features/SeeAllScreen/seeAllType.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeViewModel(HomeRepository(HomeLocalService()))
        ..loadHomeData(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderWidget(),
            RowsSeeAll(title: 'Trip Package', type: SeeAllType.trips),
            TripeListView(isSeeAll: false),
            RowsSeeAll(title: 'Hotels', type: SeeAllType.hotels),
            HotelListView(isSeeAll: false),
            RowsSeeAll(title: 'Restaurants', type: SeeAllType.restaurants),
            RestaurantListView(isSeeAll: false),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
