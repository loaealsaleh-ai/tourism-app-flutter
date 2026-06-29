import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/Hotels/data/models/room_model.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/hotel_repository.dart';

class HotelDetailsViewModel extends Cubit<List<RoomModel>> {
  final HotelRepository repository;

  HotelDetailsViewModel(this.repository) : super(const []);

  void loadRooms() {
    emit(repository.getRooms());
  }
}
