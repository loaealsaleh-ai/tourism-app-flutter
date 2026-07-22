import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../data/models/favorite_model.dart';
import '../view_models/favorites_view_model.dart';

class FavoriteActionButton extends StatelessWidget {
  final FavoriteItemModel item;
  final double size;

  const FavoriteActionButton({
    super.key,
    required this.item,
    this.size = 34,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesViewModel, List<FavoriteItemModel>>(
      buildWhen: (previous, current) =>
      previous.any((e) => e.id == item.id && e.type == item.type) !=
          current.any((e) => e.id == item.id && e.type == item.type),
      builder: (context, favorites) {
        final isFav = favorites.any((e) => e.id == item.id && e.type == item.type);

        return GestureDetector(
          onTap: () => context.read<FavoritesViewModel>().toggleFavorite(item),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: kPrimaryColor,
              size: size * 0.55,
            ),
          ),
        );
      },
    );
  }
}