import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/trip_model.dart';

class HomeLocalService {
  List<TripModel> getTrips() {
    return const [
      TripModel(
        title: 'Explore Palmyra',
        location: 'Palmyra, Syria',
        image: 'assets/images/HomeImage/Busra.png',
        duration: '3 Days 2 Nights',
        price: '\$120',
        rating: 4.8,
        reviews: 230,
      ),
    ];
  }

  List<HotelModel> getHotels() {
    return const [
      HotelModel(
        name: 'Royal Hotel',
        location: 'Damascus, Syria',
        image: 'assets/rest.png',
        price: '\$120/night',
        rating: 4.8,
      ),
    ];
  }

  List<RestaurantModel> getRestaurants() {
    return const [
      RestaurantModel(
        name: 'Naranj Restaurant',
        location: 'Old Damascus',
        image: 'assets/rest.png',
        category: 'Syrian Food',
        averagePrice: '\$15 avg',
        rating: 4.8,
      ),
    ];
  }
}
