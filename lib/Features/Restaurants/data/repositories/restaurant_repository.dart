import '../models/restaurant_model.dart';
import '../services/restaurant_local_service.dart';

class RestaurantRepository {
  final RestaurantLocalService restaurantLocalService;

  RestaurantRepository(this.restaurantLocalService);

  List<RestaurantModel> getRestaurants() => restaurantLocalService.getRestaurants();
}