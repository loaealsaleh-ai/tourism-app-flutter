import 'package:tourismapp/core/network/api_client.dart';


class RoomService {
  final ApiService apiService;

  RoomService( this.apiService);
  Future<dynamic> getRooms(int idHotel) async{
    final response = await apiService.get(
      endpoint: 'hotels/$idHotel/getrooms',
    );
    return response.data;
  }
  Future<dynamic> getRoomById(int idRoom) async {
    final response = await apiService.get(
      endpoint: 'oneroom/$idRoom',
    );

    return response.data;
  }

}
