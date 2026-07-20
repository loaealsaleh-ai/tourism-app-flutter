import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/data/repositories/home_repository.dart';
import 'package:tourismapp/Features/HomeScreen/data/services/home_service.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/view_models/home_view_model.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/widgets/home_header_widget.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/widgets/lists_view_widgets/hotel_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/widgets/lists_view_widgets/restaurant_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/widgets/lists_view_widgets/trip_list_view.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/widgets/row_see_all.dart';
import 'package:tourismapp/Features/SeeAllScreen/presentation/view_models/see_all_type.dart';
import '../../../../core/network/api_client.dart';
import '../../../Hotels/data/repositories/hotel_repository.dart';
import '../../../Hotels/data/services/hotel_service.dart';
import '../../../Hotels/presentation/view_models/hotelCubit/hotel_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeViewModel(
            HomeRepository(HomeService()),
          )..loadHomeData(),
        ),

        BlocProvider(
          create: (_) => HotelCubit(
            HotelRepository(
              HotelService(
                ApiService(Dio()),
              ),
            ),
          )..getHotels(),
        ),
      ],
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
