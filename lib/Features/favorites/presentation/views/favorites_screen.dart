import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Restaurants/data/models/restaurant_nav_extra.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/favorite_model.dart';
import '../view_models/favorites_view_model.dart';
import '../widgets/favorite_item_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedTab = 1; // default to Hotels tab

  @override
  void initState() {
    super.initState();
    context.read<FavoritesViewModel>().loadFavorites();
  }

  void _navigateToDetails(BuildContext context, FavoriteItemModel item) {
    switch (item.type) {
      case FavoriteType.hotel:
        context.push(
          AppRouter.routRoomDetails,
          extra: item,
        );
        break;
      case FavoriteType.restaurant:
        context.push(
          AppRouter.routRestaurantDetails,
          extra: RestaurantNavExtra(
            favoriteItem: item,
            description: item.description,
            openTime: item.openTime,
            closeTime: item.closeTime,
            type: item.restaurantType,
          ),
        );
        break;
      case FavoriteType.trip:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Trip details coming soon")),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildTabs(),
          const SizedBox(height: 12),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    const labels = ["Trips", "Hotels", "Restaurants"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = index),
              child: Container(
                margin: EdgeInsets.only(right: index != labels.length - 1 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kPrimaryColor.withValues(alpha: 0.3)),
                ),
                child: Text(
                  labels[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return _FavoritesListView(
          type: FavoriteType.trip,
          emptyMessage: "No favorite trips yet",
          onItemTap: _navigateToDetails,
        );
      case 1:
        return _FavoritesListView(
          type: FavoriteType.hotel,
          emptyMessage: "No favorite hotels yet",
          onItemTap: _navigateToDetails,
        );
      case 2:
        return _FavoritesListView(
          type: FavoriteType.restaurant,
          emptyMessage: "No favorite restaurants yet",
          onItemTap: _navigateToDetails,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _FavoritesListView extends StatelessWidget {
  final FavoriteType type;
  final String emptyMessage;
  final void Function(BuildContext context, FavoriteItemModel item) onItemTap;

  const _FavoritesListView({
    required this.type,
    required this.emptyMessage,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesViewModel, List<FavoriteItemModel>>(
      builder: (context, favorites) {
        final items = favorites.where((e) => e.type == type).toList();

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_border, size: 48, color: Colors.grey.shade400),
                const SizedBox(height: 12),
                Text(emptyMessage, style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) => FavoriteItemCard(
            item: items[index],
            onTap: () => onItemTap(context, items[index]),
          ),
        );
      },
    );
  }
}