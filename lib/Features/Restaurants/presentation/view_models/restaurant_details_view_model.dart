import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/Restaurants/data/models/restaurant_model.dart';
import 'package:tourismapp/Features/Restaurants/data/repositories/restaurant_repository.dart';

class RestaurantDetailsViewModel extends Cubit<List<RestaurantModel>> {
  final RestaurantRepository repository;

  RestaurantDetailsViewModel(this.repository) : super(const []);

  void loadRestaurants() {
    emit(repository.getRestaurants());
  }
}