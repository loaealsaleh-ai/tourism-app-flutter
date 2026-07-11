import '../models/room_model.dart';
import '../services/hotel_local_service.dart';

class HotelRepository {
  final HotelLocalService hotelLocalService;

  HotelRepository(this.hotelLocalService);

  List<RoomModel> getRooms() => hotelLocalService.getRooms();
}
