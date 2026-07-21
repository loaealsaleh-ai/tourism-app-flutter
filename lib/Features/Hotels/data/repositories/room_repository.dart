import '../models/room_model.dart';
import '../services/room_service.dart';

class RoomRepository {
  final RoomService roomService;

  RoomRepository(this.roomService);

  Future<List<RoomModel>> getRooms(int idHotel) async {
    final data = await roomService.getRooms(idHotel);

    final List rooms = data['data'] ?? [];

    return (data['data'] as List)
        .map((e) => RoomModel.fromJson(e))
        .toList();
  }

  Future<RoomModel> getRoomById(int idRoom) async {
    final response = await roomService.getRoomById(idRoom);

    return RoomModel.fromJson(response['data']);
  }

}
