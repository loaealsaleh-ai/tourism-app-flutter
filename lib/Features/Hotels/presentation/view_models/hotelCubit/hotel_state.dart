
import '../../../data/models/hotel_model.dart';

abstract class HotelState {}

 class HotelInitial extends HotelState {}
 class HotelLoading extends HotelState{
 }
class HotelSuccess extends HotelState {
  final List<HotelModel> hotels;
  HotelSuccess(this.hotels);
}

class HotelError extends HotelState {
  final String message;
  HotelError(this.message);
}

