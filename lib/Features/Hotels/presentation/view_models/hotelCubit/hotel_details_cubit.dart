

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/hotel_repository.dart';
import 'hotel_details_state.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsState> {
  final HotelRepository repository;

  HotelDetailsCubit(this.repository) : super(HotelDetailsInitial());

  Future<void> getHotelById(int id)async {
    emit(HotelDetailsLoading());
    try{
      final hotel =await repository.getHotelById(id);
      emit(
        HotelDetailsSuccess(hotel),
      );
    }catch(e){
      emit(HotelDetailsError(e.toString()));
    }
  }
}
