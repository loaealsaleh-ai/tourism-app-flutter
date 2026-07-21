
import '../../../../core/network/api_client.dart';

class HotelService {
  final ApiService apiService;

  HotelService(this.apiService);

  Future<dynamic> getHotels() async {
    final response = await apiService.get(
      endpoint: 'allhotels',
    );

    return response.data;
  }

  Future<dynamic> getHotelById(int id) async {
    final response = await apiService.get(
      endpoint: 'Onehotels/$id',
    );

    return response.data;
  }
}
