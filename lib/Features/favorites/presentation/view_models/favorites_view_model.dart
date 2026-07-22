import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favorite_model.dart';
import '../../data/repositories/favorites_repository.dart';

class FavoritesViewModel extends Cubit<List<FavoriteItemModel>> {
  final FavoritesRepository repository;

  FavoritesViewModel(this.repository) : super(const []);

  Future<void> loadFavorites() async {
    final items = await repository.getFavorites();
    emit(items);
  }

  Future<void> toggleFavorite(FavoriteItemModel item) async {
    final updated = await repository.toggleFavorite(item);
    emit(updated);
  }

  bool isFavorite(String id, FavoriteType type) {
    return state.any((e) => e.id == id && e.type == type);
  }

  List<FavoriteItemModel> byType(FavoriteType type) {
    return state.where((e) => e.type == type).toList();
  }
}