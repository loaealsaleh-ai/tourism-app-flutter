import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/hotel_repository.dart';
import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final HotelRepository repository;

  HotelCubit(this.repository) : super(HotelInitial());

  Future<void> getHotels() async {
    emit(HotelLoading());
    try {
      final hotels = await repository.getHotels();
      emit(HotelSuccess(hotels));
    } catch (e) {
      emit(HotelError(e.toString()));
    }
  }
}