import '../models/hotel_model.dart';
import '../services/hotel_service.dart';

class HotelRepository {
  final HotelService hotelService;

  HotelRepository(this.hotelService);

  Future<List<HotelModel>> getHotels() async {
    final data = await hotelService.getHotels();

    return (data['data'] as List)
        .map((e) => HotelModel.fromJson(e))
        .toList();
  }

  Future<HotelModel> getHotelById(int id) async {
    final response = await hotelService.getHotelById(id);

    return HotelModel.fromJson(response['data']);
  }
}