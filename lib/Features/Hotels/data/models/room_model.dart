class RoomModel {
  final int id;
  final String description;
  final int bedsCount;
  final int bathroomsCount;
  final bool hasBalcony;
  final int floor;
  final double pricePerNight;
  final double rate;
  final String roomType;
  final List<String> images;

  RoomModel({
    required this.id,
    required this.description,
    required this.bedsCount,
    required this.bathroomsCount,
    required this.hasBalcony,
    required this.floor,
    required this.pricePerNight,
    required this.rate,
    required this.roomType,
    required this.images,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'],
      description: json['description'] ?? '',
      bedsCount: json['beds_count'] ?? 0,
      bathroomsCount: json['bathrooms_count'] ?? 0,
      hasBalcony: json['has_balcony'] == 1,
      floor: json['floor'] ?? 0,
      pricePerNight: double.parse(json['price_per_night'].toString()),      rate: (json['rate'] as num).toDouble(),
      roomType: json['room_type'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'beds_count': bedsCount,
      'bathrooms_count': bathroomsCount,
      'has_balcony': hasBalcony ? 1 : 0,
      'floor': floor,
      'price_per_night': pricePerNight,
      'rate': rate,
      'room_type': roomType,
      'images': images,
    };
  }
}