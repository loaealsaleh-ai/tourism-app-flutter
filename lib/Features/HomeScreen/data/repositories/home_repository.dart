import '../../../Hotels/data/models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/trip_model.dart';
import '../services/home_service.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository(this.homeService);

  List<TripModel> getTrips() => homeService.getTrips();

  //List<HotelModel> getHotels() => homeService.getHotels();

  List<RestaurantModel> getRestaurants() => homeService.getRestaurants();
}
