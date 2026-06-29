import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/trip_model.dart';
import '../services/home_local_service.dart';

class HomeRepository {
  final HomeLocalService homeLocalService;

  HomeRepository(this.homeLocalService);

  List<TripModel> getTrips() => homeLocalService.getTrips();

  List<HotelModel> getHotels() => homeLocalService.getHotels();

  List<RestaurantModel> getRestaurants() => homeLocalService.getRestaurants();
}
