class RoomModel {
  final String name;
  final String location;
  final String image;
  final String price;
  final int guests;
  final int beds;
  final double rating;

  const RoomModel({
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.guests,
    required this.beds,
    required this.rating,
  });
}
