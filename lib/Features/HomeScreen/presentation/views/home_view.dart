import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/data/repositories/home_repository.dart';
import 'package:tourismapp/Features/HomeScreen/data/services/home_local_service.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/view_models/home_view_model.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/home_header_widget.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/lists_view_widgets/hotel_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/lists_view_widgets/restaurant_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/lists_view_widgets/trip_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/row_see_all.dart';
import 'package:tourismapp/Features/SeeAllScreen/presentation/view_models/see_all_type.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
