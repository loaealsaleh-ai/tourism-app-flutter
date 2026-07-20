import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/data/models/restaurant_model.dart';
import 'package:tourismapp/Features/HomeScreen/data/models/trip_model.dart';
import 'package:tourismapp/Features/HomeScreen/data/repositories/home_repository.dart';

import '../../../Hotels/data/models/hotel_model.dart';

class HomeState {
  final List<TripModel> trips;
  /*final List<HotelModel> hotels;*/
  final List<RestaurantModel> restaurants;

  const HomeState({
    required this.trips,
    /*required this.hotels,*/
    required this.restaurants,
  });
}

class HomeViewModel extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeViewModel(this.repository)
      : super(
          const HomeState(trips: [],/* hotels: [],*/ restaurants: []),
        );

  void loadHomeData() {
    emit(
      HomeState(
        trips: repository.getTrips(),
       /* hotels: repository.getHotels(),*/
        restaurants: repository.getRestaurants(),
      ),
    );
  }
}
