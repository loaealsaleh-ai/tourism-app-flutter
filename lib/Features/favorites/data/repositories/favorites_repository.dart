import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/favorite_model.dart';

class FavoritesRepository {
  static const String _storageKey = 'favorite_items';

  Future<List<FavoriteItemModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_storageKey) ?? [];
    return rawList
        .map((raw) => FavoriteItemModel.fromJson(jsonDecode(raw)))
        .toList();
  }

  Future<void> _saveFavorites(List<FavoriteItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_storageKey, rawList);
  }

  Future<bool> isFavorite(String id, FavoriteType type) async {
    final current = await getFavorites();
    return current.any((e) => e.id == id && e.type == type);
  }

  /// Adds the item if it's not already favorited, or removes it if it is.
  /// Returns the updated full list of favorites.
  Future<List<FavoriteItemModel>> toggleFavorite(FavoriteItemModel item) async {
    final current = await getFavorites();
    final exists = current.any((e) => e.id == item.id && e.type == item.type);

    if (exists) {
      current.removeWhere((e) => e.id == item.id && e.type == item.type);
    } else {
      current.add(item);
    }

    await _saveFavorites(current);
    return current;
  }
}