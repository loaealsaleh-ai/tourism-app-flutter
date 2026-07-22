import 'package:tourismapp/Features/favorites/data/models/favorite_model.dart';

class RestaurantNavExtra {
  final FavoriteItemModel favoriteItem;
  final String description;
  final String openTime;
  final String closeTime;
  final String type;

  const RestaurantNavExtra({
    required this.favoriteItem,
    this.description = '',
    this.openTime = '',
    this.closeTime = '',
    this.type = '',
  });
}