import '../models/restaurant_model.dart';
import '../services/restaurant_local_service.dart';

class RestaurantRepository {
  final RestaurantLocalService restaurantLocalService;

  RestaurantRepository(this.restaurantLocalService);

  Future<List<RestaurantModel>> getRestaurants() async {
    return await restaurantLocalService.getRestaurants();
  }
}