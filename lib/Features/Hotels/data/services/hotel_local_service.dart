import '../models/room_model.dart';

class HotelLocalService {
  List<RoomModel> getRooms() {
    return const [
      RoomModel(
        name: 'Deluxe Room',
        location: 'Damascus, Syria',
        image: 'assets/rest.png',
        price: '\$120/night',
        guests: 3,
        beds: 2,
        rating: 4.8,
      ),
    ];
  }
}
