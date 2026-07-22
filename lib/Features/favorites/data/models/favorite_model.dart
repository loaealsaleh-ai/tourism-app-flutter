enum FavoriteType { hotel, restaurant, trip }

class FavoriteItemModel {
  final String id;
  final FavoriteType type;
  final String title;
  final String location;
  final String price;
  final double rating;
  final String image;

  // الحقول الإضافية الاختيارية لضمان عمل تفاصيل المطاعم والفنادق بسلاسة
  final String description;
  final String openTime;
  final String closeTime;
  final String restaurantType;

  const FavoriteItemModel({
    required this.id,
    required this.type,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.image,
    this.description = '',
    this.openTime = '',
    this.closeTime = '',
    this.restaurantType = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'title': title,
    'location': location,
    'price': price,
    'rating': rating,
    'image': image,
    'description': description,
    'openTime': openTime,
    'closeTime': closeTime,
    'restaurantType': restaurantType,
  };

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      id: json['id'] as String,
      type: FavoriteType.values.firstWhere((e) => e.name == json['type']),
      title: json['title'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      description: json['description'] ?? '',
      openTime: json['openTime'] ?? '',
      closeTime: json['closeTime'] ?? '',
      restaurantType: json['restaurantType'] ?? '',
    );
  }
}