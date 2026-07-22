import 'package:tourismapp/Features/Restaurants/data/models/restaurant_model.dart';
import 'package:tourismapp/core/network/api_client.dart';

class RestaurantLocalService {
  final ApiClient apiClient;

  RestaurantLocalService(this.apiClient);

  Future<List<RestaurantModel>> getRestaurants() async {

    final response = await apiClient.get(
      endpoint: 'allrestaurants',
    );


    final List<dynamic> data = response.data['data'];

    return data
        .map(
          (restaurant) =>
          RestaurantModel.fromJson(restaurant),
    )
        .toList();
  }
}