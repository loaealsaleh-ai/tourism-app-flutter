import '../models/restaurant_model.dart';

class RestaurantLocalService {
  List<RestaurantModel> getRestaurants() {
    return const [
      RestaurantModel(
        name: 'Deluxe Restaurant',
        location: 'Damascus, Syria',
        image: 'assets/rest.png',
        price: '\$120/person',
        guests: 3,
        tables: 2,
        rating: 4.8,
      ),
    ];
  }
}