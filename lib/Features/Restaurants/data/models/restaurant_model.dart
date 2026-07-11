class RestaurantModel {
  final String name;
  final String location;
  final String image;
  final String price;
  final int guests;
  final int tables;
  final double rating;

  const RestaurantModel({
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.guests,
    required this.tables,
    required this.rating,
  });
}